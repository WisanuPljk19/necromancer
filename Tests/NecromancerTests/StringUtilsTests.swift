//
//  StringUtilsTests.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

final class StringUtilsTests: XCTestCase {
    
    func testStringIsNilOrEmpty(){
        XCTAssertTrue(StringUtils.isNilOrEmpty(from: nil),
                      "input nil must be true")
        XCTAssertTrue(StringUtils.isNilOrEmpty(from: ""),
                      "input empty string must be true")
        XCTAssertFalse(StringUtils.isNilOrEmpty(from:
            "Hello Swift"), "input `Hello Swift` must be false")
    }
    
    func testStringIsNotNilOrEmpty(){
        XCTAssertFalse(StringUtils.isNotNilOrEmpty(from: nil),
                       "input nil must be false")
        XCTAssertFalse(StringUtils.isNotNilOrEmpty(from: ""),
                       "input empty string must be false")
        XCTAssertTrue(StringUtils.isNotNilOrEmpty(from: "Hello Swift"),
                      "input `Hello Swift` must be true")
    }
    
    func testSetValue(){
        XCTAssertNil(StringUtils.setValue(from: nil),
                     "input nil must be return nil")
        XCTAssertNil(StringUtils.setValue(from: ""),
                     "input empty string must be return nil")
        XCTAssertNotNil(StringUtils.isNotNilOrEmpty(from: "Hello Swift"),
                        "input `Hello Swift` must be return `Hello Swift`")
    }
    
    func testGetValue(){
        let str = "Hello Swift"
        XCTAssertTrue(StringUtils.getValue(from: nil) == "", "input nil must be return empty string")
        XCTAssertTrue(StringUtils.getValue(from: "") == "", "input empty string must be return empty string")
        XCTAssertTrue(StringUtils.getValue(from: str) == str, "input \"Hello Swift\" must be return \"Hello Swift\"")
    }
}
