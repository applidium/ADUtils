//
//  SecureArchiver.swift
//  ADUtils
//
//  Created by Thomas Esterlin on 02/07/2021.
// Methods inspired by these : "https://fred.appelman.net/?p=119", "https://developer.apple.com/videos/play/wwdc2019/709"

import Foundation
import CryptoKit

public protocol KeychainArchiver {
    func get(forKey: String) -> String?
    func set(value: String?, forKey: String)
}

public protocol StorageArchiver {
    func get(forKey key: String) -> Data?
    func set(_ data: Data, forKey key: String)
    func deleteValue(forKey key: String)
}

@available(iOS 13.0, *)
public class SecureArchiver {

    private enum Constants {
        static let passphrasePrefix = "cryptoKeyPassphrase_"
        static let installedPrefix = "appIsInstalled_"
    }

    private enum SecureArchiverError: Error {
        case invalidSymmetricKey
    }

    private let keychainArchiver: KeychainArchiver
    private let storageArchiver: StorageArchiver
    private let passphraseKey: String
    private var cryptoKey = SymmetricKey(size: .bits256)

    public init(keychainArchiver: KeychainArchiver,
                storageArchiver: StorageArchiver,
                appKey: String) {
        self.keychainArchiver = keychainArchiver
        self.storageArchiver = storageArchiver
        passphraseKey = "\(Constants.passphrasePrefix)\(appKey)"
    }

    // MARK: - Public

    /**
     Set a value (encrypted) for a specific key in the user defaults.
     - parameter value: The object to store in the user defaults.
     - parameter key: The key to use in the user defaults.
     */
    public func set<C: Codable>(_ value: C, forKey key: String) throws {
        do {
            let encoder = JSONEncoder()
            let valueData = try encoder.encode(value)
            let encryptedData = try ChaChaPoly.seal(valueData, using: getCryptoKey())
            let dataToStore = encryptedData.combined
            storageArchiver.set(dataToStore, forKey: key)
        } catch {
            throw error
        }
    }

    /**
     Read the value for a specific key in the user defaults.
     - parameter key: The key to read in the user defaults.
     - returns: The value associated to the key
     */
    public func value<C: Codable>(forKey key: String) throws -> C? {
        let optionalStoredValue: Data? = storageArchiver.get(forKey: key)
        if let storedData = optionalStoredValue {
            do {
                let box = try ChaChaPoly.SealedBox(combined: storedData)
                let decryptedData = try ChaChaPoly.open(box, using: getCryptoKey())
                let decoder = JSONDecoder()
                let object = try decoder.decode(C.self, from: decryptedData)
                return object
            } catch {
                throw error
            }
        }
        return nil
    }

    /**
     Delete a value for a specific key in the storage archiver.
     - parameter key: The key to read in the storage archiver.
     */
    public func deleteValue(forKey key: String) {
        storageArchiver.deleteValue(forKey: key)
    }

    // MARK: - Private

    /**
     Get the cryptographic key from the Keychain Archiver.
     - returns: A symmetric key computed from the secret passphrase stored in KA.
     */
    private func getCryptoKey() throws -> SymmetricKey {
        if let storedPassphrase = keychainArchiver.get(forKey: passphraseKey) {
            do {
                return try keyFromPassphrase(storedPassphrase)
            } catch {
                throw error
            }
        }
        let passphrase = randomString(length: 64)
        keychainArchiver.set(value: passphrase, forKey: passphraseKey)
        do {
            let newKey = try keyFromPassphrase(passphrase)
            self.cryptoKey = newKey
            return newKey
        } catch {
            throw error
        }
    }

    /**
     Create an encryption key from a given passphrase.
     - parameter passphrase: The passphrase to compute the key.
     - returns: The symmetric key computed from the passphrase.
     */
    func keyFromPassphrase(_ passphrase: String) throws -> SymmetricKey {
        // Create a SHA256 hash from the provided passphrase
        if let passphraseData = passphrase.data(using: .utf8) {
            let hash = SHA256.hash(data: passphraseData)
            // Create the key use keyData as the seed
            return SymmetricKey(data: hash)
        }
        throw SecureArchiverError.invalidSymmetricKey
    }

    /**
     Create a random string.
     - parameter length: The length of the string.
     - returns: A random string .
     */
    private func randomString(length: Int) -> String {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map { _ in letters.randomElement() ?? "a" })
    }

}