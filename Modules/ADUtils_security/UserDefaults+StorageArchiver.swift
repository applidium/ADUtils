//
//  UserDefaults+StorageArchiver.swift
//  ADUtils
//
//  Created by Benjamin Lavialle on 08/07/2021.
//

import Foundation

extension UserDefaults: StorageArchiver {

    public func getValue(forKey key: String) -> Data? {
        value(forKey: key) as? Data
    }

    public func set(_ data: Data, forKey key: String) {
        set(data as Any, forKey: key)
    }

    public func deleteValue(forKey key: String) {
        removeObject(forKey: key)
    }
}
