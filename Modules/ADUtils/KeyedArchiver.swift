//
//  KeyedArchiver.swift
//  Pods
//
//  Created by Pierre Felgines on 06/07/2020.
//

import Foundation

extension UserDefaults {

    func ad_set<Value: Encodable>(_ value: Value,
                                  forKey key: String) throws {
        let data = try JSONEncoder().encode(value)
        set(data, forKey: key)
    }

    func ad_value<Value: Decodable>(forKey key: String) -> Value? {
        guard let data = data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(Value.self, from: data)
    }
}

/**
 * KeyedArchiver is an object that stores data in UserDefaults
 */
public struct KeyedArchiver<Key> where Key: CodingKey {

    private let userDefaults: UserDefaults

    /**
     * Initialize the archiver with UserDefaults.
     * - parameter userDefaults: Default value to `UserDefaults.standard`
     */
    public init(userDefaults: UserDefaults = .standard) {
        self.userDefaults = userDefaults
    }

    // MARK: - Codable

    /**
     * Save encodable value to user defaults.
     * - parameter value: Encodable value stored in user defaults
     * - parameter key: Key used in user defaults
     * - throws: Throws error if encoding fails
     */
    public func set<Value: Encodable>(_ value: Value, forKey key: Key) throws {
        try userDefaults.ad_set(value, forKey: key.stringValue)
    }

    /**
     * Retrieve value in user defaults
     * - parameter as: Type used to decode the value
     * - parameter key: Key used in user defaults
     */
    public func value<Value: Decodable>(as: Value.Type, forKey key: Key) -> Value? {
        return userDefaults.ad_value(forKey: key.stringValue)
    }

    /**
     * Retrieve value in user defaults
     * - parameter key: Key used in user defaults
     */
    public func value<Value: Decodable>(forKey key: Key) -> Value? {
        return userDefaults.ad_value(forKey: key.stringValue)
    }

    /**
     * Remove value in user defaults
     * - parameter key: Key used in user defaults
     */
    public func removeValue(forKey key: Key) {
        userDefaults.removeObject(forKey: key.stringValue)
    }

    // MARK: - Helpers

    /**
     * Retrieve array of values in user defaults
     * - parameter of: The type of one element of the array
     * - parameter key: Key used in user defaults
     */
    public func array<Value: Decodable>(of: Value.Type, forKey key: Key) -> [Value] {
        return value(forKey: key) ?? []
    }

    /**
     * Retrieve bool in user defaults
     * - parameter key: Key used in user defaults
     */
    public func bool(forKey key: Key) -> Bool {
        return value(forKey: key) ?? false
    }

    /**
     * Retrieve string in user defaults
     * - parameter key: Key used in user defaults
     */
    public func string(forKey key: Key) -> String? {
        return value(forKey: key)
    }

    /**
     * Retrieve integer in user defaults
     * - parameter key: Key used in user defaults
     */
    public func integer(forKey key: Key) -> Int {
        return value(forKey: key) ?? 0
    }

    /**
     * Retrieve float in user defaults
     * - parameter key: Key used in user defaults
     */
    public func float(forKey key: Key) -> Float {
        return value(forKey: key) ?? 0
    }

    /**
     * Retrieve double in user defaults
     * - parameter key: Key used in user defaults
     */
    public func double(forKey key: Key) -> Double {
        return value(forKey: key) ?? 0
    }

    /**
     * Retrieve data in user defaults
     * - parameter key: Key used in user defaults
     */
    public func data(forKey key: Key) -> Data? {
        return value(forKey: key)
    }
}
