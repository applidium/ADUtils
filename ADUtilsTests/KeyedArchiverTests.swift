//
//  KeyedArchiverTests.swift
//  ADUtilsTests
//
//  Created by Pierre Felgines on 06/07/2020.
//

import Foundation
import Nimble
import Quick
import ADUtils

private extension UserDefaults {

    static var ad_empty: UserDefaults {
        let userDefaults = UserDefaults()
        let domain = Bundle.main.bundleIdentifier ?? ""
        userDefaults.removePersistentDomain(forName: domain)
        return userDefaults
    }
}

private enum Keys: String, CodingKey {
    case user
    case other
    case primitive
}

private struct User: Codable, Equatable {
    let name: String
    let age: Int
}

private func ad_noThrow(_ block: @escaping () throws -> Void) {
    expect { try block() }.toNot(throwError())
}

class KeyedArchiverTests: QuickSpec {

    override func spec() {

        var userDefaults: UserDefaults!
        var archiver: KeyedArchiver<Keys>!

        beforeEach {
            userDefaults = UserDefaults.ad_empty
            archiver = KeyedArchiver(userDefaults: userDefaults)
        }

        it("should save and retrieve value") {
            // Given
            let user = User(name: "Bob", age: 18)

            // When
            ad_noThrow { try archiver.set(user, forKey: .user) }

            // Then
            expect(userDefaults.value(forKey: Keys.user.stringValue))
                .toNot(beNil())
            expect(userDefaults.value(forKey: Keys.other.stringValue))
                .to(beNil())

            let savedUser = archiver.value(as: User.self, forKey: .user)
            expect(savedUser).toNot(beNil())
            expect(savedUser).to(equal(user))

            archiver.removeValue(forKey: .user)
            expect(userDefaults.value(forKey: Keys.user.stringValue))
                .to(beNil())
            let nilUser: User? = archiver.value(forKey: .user)
            expect(nilUser).to(beNil())
        }

        it("should retrieve array") {
            // Given
            let users = [
                User(name: "Bob", age: 18),
                User(name: "Jony", age: 40),
            ]

            // When
            ad_noThrow { try archiver.set(users, forKey: .user) }

            // Then
            let values = archiver.array(of: User.self, forKey: .user)
            expect(values).to(equal(users))
        }

        describe("Store primitive value") {

            it("should store string") {
                // Given
                let value = "abc"
                var readValue = archiver.string(forKey: .primitive)
                expect(readValue).to(beNil())

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.string(forKey: .primitive)
                expect(readValue).to(equal(value))
            }

            it("should store bool") {
                // Given
                let value = true
                var readValue = archiver.bool(forKey: .primitive)
                expect(readValue).to(beFalse())

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.bool(forKey: .primitive)
                expect(readValue).to(equal(value))
            }

            it("should store int") {
                // Given
                let value = 3
                var readValue = archiver.integer(forKey: .primitive)
                expect(readValue).to(equal(0))

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.integer(forKey: .primitive)
                expect(readValue).to(equal(value))
            }

            it("should store float") {
                // Given
                let value: Float = 3.0
                var readValue = archiver.float(forKey: .primitive)
                expect(readValue).to(equal(0))

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.float(forKey: .primitive)
                expect(readValue).to(equal(value))
            }

            it("should store double") {
                // Given
                let value: Double = 3.0
                var readValue = archiver.double(forKey: .primitive)
                expect(readValue).to(equal(0))

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.double(forKey: .primitive)
                expect(readValue).to(equal(value))
            }

            it("should store data") {
                // Given
                let value: Data = "This is a test".data(using: .utf8)!
                var readValue = archiver.data(forKey: .primitive)
                expect(readValue).to(beNil())

                // When
                ad_noThrow { try archiver.set(value, forKey: .primitive) }

                // Then
                readValue = archiver.data(forKey: .primitive)
                expect(readValue).to(equal(value))
            }
        }
    }
}
