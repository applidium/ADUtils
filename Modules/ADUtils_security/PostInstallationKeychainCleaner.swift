//
//  PostInstallationKeychainCleaner.swift
//  ADUtils
//
//  Created by Benjamin Lavialle on 07/07/2021.
//

import Foundation

/**
 A protocol definign the capacity to wipe a keychain,
 his is a proxy to any helper that might be use to access the keychain

 For example for `KeychainAccess` https://github.com/kishikawakatsumi/KeychainAccess
 ```
 extension Keychain: KeychainWiper {

     func wipeKeychain() throws {
         try removeAll()
     }
 }
 ```
 Lets use a `Keychain` object as `KeychainWiper`
 */
public protocol KeychainWiper {
    func wipeKeychain() throws
}

/**
 * A class that can be used to check if the keychain as to be wiped at launch.
 * This ensure the keychain is not persisted across application installation & deletion
 * The test is based on setting a boolean flag in the user defaults.
 */

public class PostInstallationKeychainCleaner {

    private enum Constant {
        static let ApplicationLaunchedFlag = "_PIKC_ALF"
    }

    private let keychainWipers: [KeychainWiper]
    private let userDefaults: UserDefaults

    /**
     Creates a `PostInstallationKeychainCleaner` with the given user defaults and a single keychain wiper
     - parameter keychainWiper: The keychain wiper to call if wipe is necessary
     - parameter userDefaults: The user defaults used to store and check the first launch flag
     */

    public convenience init(keychainWiper: KeychainWiper,
                            userDefaults: UserDefaults) {
        self.init(keychainWipers: [keychainWiper], userDefaults: userDefaults)
    }

    /**
     Creates a `PostInstallationKeychainCleaner` with the given user defaults and a single keychain wiper
     - parameter keychainWipers: The keychain wipers to call if wipe is necessary
     - parameter userDefaults: The user defaults used to store and check the first launch flag
     */

    public init(keychainWipers: [KeychainWiper],
                userDefaults: UserDefaults) {
        self.keychainWipers = keychainWipers
        self.userDefaults = userDefaults
    }

    /**
     Check the presence of the "application already launched after installation flag"
     and trigger keychain wipes if necessary
     */

    public func checkInstallation() throws {
        guard !userDefaults.bool(forKey: Constant.ApplicationLaunchedFlag) else { return }
        try wipeKeychains()
        userDefaults.set(true, forKey: Constant.ApplicationLaunchedFlag)
        userDefaults.synchronize()
    }

    /**
     Convenience method to manually wipe keychains, for example to be used after user logout
     */

    public func wipeKeychains() throws {
        try keychainWipers.forEach { try $0.wipeKeychain() }
    }
}
