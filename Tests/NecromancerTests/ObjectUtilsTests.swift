//
//  ObjectUtilsTests.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

final class ObjectUtilsTests: XCTestCase {

    func testObjectIsNil(){
        XCTAssertTrue(ObjectUtils.isNil(any: nil), "input nil must be true")
        let str = "Hello Swift"
        XCTAssertFalse(ObjectUtils.isNil(any: str), "input `Hello Swift` must be false")
        let double = 25.62
        XCTAssertFalse(ObjectUtils.isNil(any: double), "input 25.62 must be false")
    }
    
    func testObjectIsNotNil(){
        XCTAssertFalse(ObjectUtils.isNotNil(any: nil), "input nil must be false")
        let str = "Hello Swift"
        XCTAssertTrue(ObjectUtils.isNotNil(any: str), "input `Hello Swift` must be true")
        let double = 25.62
        XCTAssertTrue(ObjectUtils.isNotNil(any: double), "input 25.62 must be true")
    }
}
