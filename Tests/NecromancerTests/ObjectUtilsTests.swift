//
//  ObjectUtilsTests.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

struct UserTest: Codable {
    var name: String?
    var age: Int?
}

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
    
    func testEncodeObjectToJson(){
        let userTest = UserTest(name: "Tony", age: 37)
        let jsonObject = ObjectUtils.encodeJson(from: userTest)
        XCTAssertNotNil(jsonObject, "input Codable must not be nil")
        XCTAssertTrue(userTest.name == (jsonObject?["name"] as? String), "name is equal")
    }
    
    func testDecodeJsonToObject(){
        let userTest = UserTest(name: "Tony", age: 37)
        XCTAssertNoThrow(try userTest.getData())
        let userDecode = ObjectUtils.decodeJson(from: UserTest.self, data: try! userTest.getData())
        XCTAssertTrue(userTest.name == userDecode?.name, "name is equal")
    }
}
