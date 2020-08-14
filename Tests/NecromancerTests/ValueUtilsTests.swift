//
//  ValueUtilsTests.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

final class ValueUtilsTests: XCTestCase {

    func testObjectIsNil(){
        XCTAssertTrue(ValueUtils.isNil(any: nil), "input nil must be true")
        let str = "Hello Swift"
        XCTAssertFalse(ValueUtils.isNil(any: str), "input `Hello Swift` must be false")
        let double = 25.62
        XCTAssertFalse(ValueUtils.isNil(any: double), "input 25.62 must be false")
    }
    
    func testObjectIsNotNil(){
        XCTAssertFalse(ValueUtils.isNotNil(any: nil), "input nil must be false")
        let str = "Hello Swift"
        XCTAssertTrue(ValueUtils.isNotNil(any: str), "input `Hello Swift` must be true")
        let double = 25.62
        XCTAssertTrue(ValueUtils.isNotNil(any: double), "input 25.62 must be true")
    }
    
    func testConvertStringToInt(){
        let intValue = ValueUtils.toInt(from: "23")
        XCTAssertNotNil(intValue, "input \"23\" must be not nil")
        XCTAssertTrue(intValue! == 23, "intValue must be 23")
        let intValidValue = ValueUtils.toInt(from: "ABC")
        XCTAssertNil(intValidValue, "input \"ABC\" must be nil")
        let intDoubleValue = ValueUtils.toInt(from: "23.525")
        XCTAssertNil(intDoubleValue, "input \"23.525\" must be nil")
        XCTAssertNil(ValueUtils.toInt(from: nil), "input nil must be nil")
        let doubleValue = ValueUtils.toDouble(from: "23.5")
        XCTAssertNotNil(doubleValue, "input \"23.5\" must be not nil")
        XCTAssertTrue(doubleValue! == 23.5, "intValue must be 23.5")
        let doubleValidValue = ValueUtils.toDouble(from: "ABC")
        XCTAssertNil(doubleValidValue, "input \"ABC\" must be nil")
        let doubleIntValue = ValueUtils.toDouble(from: "20")
        XCTAssertNotNil(doubleIntValue, "input \"20\" must be not nil")
        XCTAssertTrue(doubleIntValue! == 20.0, "intValue must be 20.0")
        XCTAssertNil(ValueUtils.toDouble(from: nil), "input nil must be nil")
    }
}
