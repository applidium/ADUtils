//
//  PostInstallationKeychainCleanerTests.swift
//  ADUtilsTests
//
//  Created by Benjamin Lavialle on 07/07/2021.
//

import Foundation
import Quick
import Nimble
import ADUtils

private class KeychainWiperMock: KeychainWiper {

    private(set) var didWipe = false

    func wipeKeychain() {
        didWipe = true
    }
}

class PostInstallationKeychainCleanerTests: QuickSpec {

    override func spec() {

        var keychainWiper: KeychainWiperMock!
        var userDefaults: UserDefaults!
        var postInstallationKeychainCleaner: PostInstallationKeychainCleaner!

        beforeEach {
            keychainWiper = KeychainWiperMock()
            userDefaults = UserDefaults()
            postInstallationKeychainCleaner = PostInstallationKeychainCleaner(
                keychainWiper: keychainWiper,
                userDefaults: userDefaults
            )
        }

        describe("First launch tests") {
            it("should wipe keychain") {
                expect {
                    userDefaults.set(nil, forKey: "_PIKC_ALF")
                    try? postInstallationKeychainCleaner.checkInstallation()
                    expect(keychainWiper.didWipe).to(beTrue())
                    expect(userDefaults.bool(forKey: "_PIKC_ALF")).to(beTrue())
                }.toNot(throwError())
            }
        }

        describe("Second launch tests") {
            it("should not wipe keychain") {
                expect {
                    userDefaults.set(true, forKey: "_PIKC_ALF")
                    try? postInstallationKeychainCleaner.checkInstallation()
                    expect(keychainWiper.didWipe).to(beFalse())
                    expect(userDefaults.bool(forKey: "_PIKC_ALF")).to(beTrue())
                }.toNot(throwError())
            }
        }
    }
}
