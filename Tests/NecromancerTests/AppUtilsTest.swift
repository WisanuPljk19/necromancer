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
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.0", appStoreVersion: "1.0.0") == .unknown)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.0", appStoreVersion: "2.0.0") == .major)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.0", appStoreVersion: "1.1.0") == .minor)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.0", appStoreVersion: "1.0.1") == .patch)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.0.0", appStoreVersion: "1.0.0.1") == .revision)
        
        XCTAssertTrue(AppUtils.checkVersion(with: "2.0.0", appStoreVersion: "1.0.0") == .unknown)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.1.0", appStoreVersion: "1.0.0") == .unknown)
        XCTAssertTrue(AppUtils.checkVersion(with: "1.0.1", appStoreVersion: "1.0.0") == .unknown)

    }
    
    
}
