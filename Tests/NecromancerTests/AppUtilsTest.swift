//
//  AppUtilsTest.swift
//
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

final class AppUtilsTest: XCTestCase {
    
    func testCheckVersionApp(){
        XCTAssertTrue(Necromancer.Apps.checkVersion(with: "1.0.0", appStoreVersion: "1.0.0") == .unknown)
        XCTAssertTrue(Necromancer.Apps.checkVersion(with: "1.0.0", appStoreVersion: "2.0.0") == .major)
        XCTAssertTrue(Necromancer.Apps.checkVersion(with: "1.0.0", appStoreVersion: "1.1.0") == .minor)
        XCTAssertTrue(Necromancer.Apps.checkVersion(with: "1.0.0", appStoreVersion: "1.0.1") == .patch)
        XCTAssertTrue(Necromancer.Apps.checkVersion(with: "1.0.0.0", appStoreVersion: "1.0.0.1") == .revision)
    }
    
}
