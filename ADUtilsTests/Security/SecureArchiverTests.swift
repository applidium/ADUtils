//
//  ArrayFilterTests.swift
//  ADUtilsTests
//
//  Created by Thomas Esterlin on 06/07/2021.
//

import Foundation
import Quick
import Nimble
import ADUtils

private struct Car: Codable {
    let color: String
    let brand: String
    let year: Int
}

extension Car: Equatable {
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.color == rhs.color
            && lhs.brand == rhs.brand
            && lhs.year == lhs.year
    }
}

private class StorageArchiverImplementation: StorageArchiver {

    private var storage: [String: Data] = [:]

    func getValue(forKey key: String) -> Data? {
        return storage[key]
    }

    func set(_ data: Data, forKey key: String) {
        storage[key] = data
    }

    func deleteValue(forKey key: String) {
        storage[key] = nil
    }
    
}

private class KeychainArchiverImplementation: KeychainArchiver {

    private var storage: [String: String] = [:]

    func getValue(forKey: String) -> String? {
        return storage[forKey]
    }

    func set(value: String?, forKey: String) {
        storage[forKey] = value
    }

    func cleanStorage() {
        storage = [:]
    }

}

@available(iOS 13.0, *)
class SecureArchiverTests: QuickSpec {

    override func spec() {

        var storageArchiver: StorageArchiverImplementation!
        var keychainArchiver: KeychainArchiverImplementation!

        beforeEach {
            storageArchiver = StorageArchiverImplementation()
            keychainArchiver = KeychainArchiverImplementation()
        }

        describe("Write and Read tests") {
            it("should write and read one codable") {
                expect {
                    let myCar = Car(color: "Grey", brand: "Ford", year: 1967)
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: storageArchiver,
                        appKey: ""
                    )

                    // When
                    try secureArchiver.set(myCar, forKey: "car")
                    let readCar: Car? = try secureArchiver.value(forKey: "car")

                    // Then
                    expect(readCar).toNot(beNil())
                    if let readCar = readCar {
                        expect(readCar).to(equal(myCar))
                    }
                }.toNot(throwError())
            }

            it("should write and read several codables") {
                expect {
                    let myFirstCar = Car(color: "Grey", brand: "Ford", year: 1967)
                    let mySecondCar = Car(color: "Blue", brand: "Porsche", year: 1999)
                    let myCars = [myFirstCar, mySecondCar]
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: storageArchiver,
                        appKey: ""
                    )

                    // When
                    try secureArchiver.set(myCars, forKey: "cars")
                    let optionalReadCars: [Car]? = try secureArchiver.value(forKey: "cars") ?? []

                    // Then
                    if let readCars = optionalReadCars {
                        expect(readCars.count).to(equal(2))
                        expect(readCars).to(equal(myCars))
                    } else {
                        fail()
                    }
                }.toNot(throwError())
            }

            it("should delete codables") {
                expect {
                    let myCar = Car(color: "Grey", brand: "Ford", year: 1967)
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: storageArchiver,
                        appKey: ""
                    )

                    // When
                    try secureArchiver.set(myCar, forKey: "car")
                    secureArchiver.deleteValue(forKey: "car")
                    let readCar: Car? = try secureArchiver.value(forKey: "car")

                    // Then
                    expect(readCar).to(beNil())
                }.toNot(throwError())
            }
        }

        describe("user defaults tests") {
            it("should write and read several codables") {
                expect {
                    let myFirstCar = Car(color: "Grey", brand: "Ford", year: 1967)
                    let mySecondCar = Car(color: "Blue", brand: "Porsche", year: 1999)
                    let myCars = [myFirstCar, mySecondCar]
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: UserDefaults.standard,
                        appKey: ""
                    )

                    // When
                    try secureArchiver.set(myCars, forKey: "cars")
                    let optionalReadCars: [Car]? = try secureArchiver.value(forKey: "cars")

                    // Then
                    if let readCars = optionalReadCars {
                        expect(readCars.count).to(equal(2))
                        expect(readCars).to(equal(myCars))
                        secureArchiver.deleteValue(forKey: "cars")
                        let deletedDeadCars: [Car]? = try secureArchiver.value(forKey: "cars")
                        expect(deletedDeadCars).to(beNil())
                    } else {
                        fail()
                    }
                }.toNot(throwError())
            }
        }

        describe("passphrase tests") {
            it("passphrase should be set when application is installed") {
                expect {
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: storageArchiver,
                        appKey: "secureArchiverTests"
                    )

                    // When
                    try secureArchiver.set("Hello", forKey: "myWord")
                    let storedPassphrase = keychainArchiver.getValue(forKey: "cryptoKeyPassphrase_secureArchiverTests")

                    // Then
                    expect(storedPassphrase).toNot(beNil())
                }.toNot(throwError())
            }

            it("passphrase should be different when application is re-installed") {
                expect {
                    // Given
                    let secureArchiver = SecureArchiver(
                        keychainArchiver: keychainArchiver,
                        storageArchiver: storageArchiver,
                        appKey: "secureArchiverTests"
                    )

                    // When
                    try secureArchiver.set("Hello", forKey: "myWord")
                    let firstStoredPassphrase = keychainArchiver.getValue(forKey: "cryptoKeyPassphrase_secureArchiverTests")
                    keychainArchiver.cleanStorage()
                    try secureArchiver.set("Hello", forKey: "myWord")
                    let secondStoredPassphrase = keychainArchiver.getValue(forKey: "cryptoKeyPassphrase_secureArchiverTests")

                    // Then
                    expect(firstStoredPassphrase).toNot(equal(secondStoredPassphrase))
                }.toNot(throwError())
            }
        }
    }
}
