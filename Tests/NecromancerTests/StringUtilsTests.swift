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
    
    func testConvertStringToInt(){
        let intValue = StringUtils.toInt(from: "23")
        XCTAssertNotNil(intValue, "input \"23\" must be not nil")
        XCTAssertTrue(intValue! == 23, "intValue must be 23")
        let intValidValue = StringUtils.toInt(from: "ABC")
        XCTAssertNil(intValidValue, "input \"ABC\" must be nil")
    }
    
    func testConvertStringToDouble(){
        let intDoubleValue = StringUtils.toInt(from: "23.525")
        XCTAssertNil(intDoubleValue, "input \"23.525\" must be nil")
        XCTAssertNil(StringUtils.toInt(from: nil), "input nil must be nil")
        let doubleValue = StringUtils.toDouble(from: "23.5")
        XCTAssertNotNil(doubleValue, "input \"23.5\" must be not nil")
        XCTAssertTrue(doubleValue! == 23.5, "intValue must be 23.5")
        let doubleValidValue = StringUtils.toDouble(from: "ABC")
        XCTAssertNil(doubleValidValue, "input \"ABC\" must be nil")
        let doubleIntValue = StringUtils.toDouble(from: "20")
        XCTAssertNotNil(doubleIntValue, "input \"20\" must be not nil")
        XCTAssertTrue(doubleIntValue! == 20.0, "intValue must be 20.0")
        XCTAssertNil(StringUtils.toDouble(from: nil), "input nil must be nil")
    }
    
    func testCheckRegEx(){
        XCTAssertTrue(StringUtils.checkRegEx(from: "email@gmail.com", with: .email),
                      "right email must be true")
        XCTAssertFalse(StringUtils.checkRegEx(from: nil, with: .email),
                       "nil must be false")
        XCTAssertFalse(StringUtils.checkRegEx(from: "hellow this is me", with: .email),
                       "Mismatch email must be false")
        
        XCTAssertTrue(StringUtils.checkRegEx(from: "0912345678", with: .mobile),
                      "right mobile must be true")
        XCTAssertFalse(StringUtils.checkRegEx(from: nil, with: .mobile),
                       "nil must be false")
        XCTAssertFalse(StringUtils.checkRegEx(from: "abcdefghij", with: .mobile),
                       "Mismatch mobile must be false")
        
        XCTAssertTrue(StringUtils.checkRegEx(from: "21.2", with: .decimal),
                      "right decimal must be true")
        XCTAssertTrue(StringUtils.checkRegEx(from: "12374", with: .decimal),
                      "right number i decimal")
        XCTAssertFalse(StringUtils.checkRegEx(from: nil, with: .decimal),
                       "nil must be false")
        XCTAssertFalse(StringUtils.checkRegEx(from: "abcdefghij", with: .decimal),
                       "Mismatch mobile must be false")
        
        XCTAssertTrue(StringUtils.checkRegEx(from: "12374", with: .number),
                      "right number must be true")
        XCTAssertFalse(StringUtils.checkRegEx(from: "124.231", with: .number),
                      "decimal is not number")
        XCTAssertFalse(StringUtils.checkRegEx(from: nil, with: .number),
                       "nil must be false")
        XCTAssertFalse(StringUtils.checkRegEx(from: "abcdefghij", with: .number),
                       "Mismatch mobile must be false")
    }
    
    func testValidateTextfield(){
        XCTAssertFalse(StringUtils.validateTextField(from: nil,
                                                     with: .default,
                                                     limit: 100,
                                                     isRequire: true),
                       "input nil and isRequire must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: nil,
                                                    with: .default,
                                                    limit: 100,
                                                    isRequire: false),
                      "input nil and isNotRequire must be return true")
        XCTAssertFalse(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                     with: .default,
                                                     limit: 5,
                                                     isRequire: true),
                       "input string count > limit must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                    with: .default,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string count < limit must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: "123456789011121314",
                                                    with: .numberPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string number and keyboard type .numberPad must be return true")
        XCTAssertFalse(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                     with: .numberPad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .numberPad must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: "123456789011121314",
                                                    with: .decimalPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string number and keyboard type .numberPad must be return true")
        XCTAssertTrue(StringUtils.validateTextField(from: "1234.123213",
                                                    with: .decimalPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string decimal and keyboard type .numberPad must be return true")
        XCTAssertFalse(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                     with: .decimalPad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .numberPad must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: "email@email.com",
                                                    with: .emailAddress,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string email and keyboard type .emailAddress must be return true")
        XCTAssertFalse(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                     with: .emailAddress,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .emailAddress must be return false")
        XCTAssertTrue(StringUtils.validateTextField(from: "0991234567",
                                                    with: .phonePad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string phone and keyboard type .phonePad must be return true")
        XCTAssertFalse(StringUtils.validateTextField(from: "123422",
                                                     with: .phonePad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string number and keyboard type .phonePad must be return false")
        XCTAssertFalse(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                     with: .phonePad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .phonePad must be return false")
        
        XCTAssertTrue(StringUtils.validateTextField(from: "abcdefg1234567890",
                                                    with: .namePhonePad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string phone and keyboard type .namePhonePad must be return true because regEx = .none")
    }
    
    func testIsCompose(){
        let stringEn = "Hello Swift"
        XCTAssertFalse(StringUtils.isCompose(from: nil, with: "Sw"), "string nil must be return nil")
        XCTAssertTrue(StringUtils.isCompose(from: stringEn, with: "Sw"),
                      "string `Hello Swift` and check `Sw` must be return true")
        XCTAssertFalse(StringUtils.isCompose(from: stringEn, with: "sw"),
        "string `Hello Swift` and check `sw` must be return false")
        
        let stringTh = "สวัสดี สวิฟท์"
        XCTAssertFalse(StringUtils.isCompose(from: nil, with: "สวิ"), "string nil must be return nil")
        XCTAssertTrue(StringUtils.isCompose(from: stringTh, with: "สวิ"),
                      "string `สวัสดี สวิฟท์` and check `สวิ` must be return true")
        XCTAssertFalse(StringUtils.isCompose(from: stringTh, with: "สวส"),
        "string `สวัสดี สวิฟท์` and check `สวส` must be return false")
    }
    
    func testSubstring(){
        let str = "Hello Work My Swift Language"
        XCTAssertNil(StringUtils.substring(from: str, beginIndex: 500, endIndex: 5000))
        XCTAssertNotNil(StringUtils.substring(from: str, beginIndex: 0, endIndex: 5))
        XCTAssertTrue(StringUtils.substring(from: str, beginIndex: 0, endIndex: 5) == "Hello")
        
        XCTAssertNil(StringUtils.substring(from: str, beginIndex: -5))
        XCTAssertNotNil(StringUtils.substring(from: str, beginIndex: 0))
        XCTAssertTrue(StringUtils.substring(from: str, beginIndex: 0) == str)

        XCTAssertNil(StringUtils.substring(from: str, endIndex: 5000))
        XCTAssertNotNil(StringUtils.substring(from: str, endIndex: 5))
        XCTAssertTrue(StringUtils.substring(from: str, endIndex: 5) == "Hello")
        
        Log.debug(str)
        Log.error(str)
        Log.info(str)
        Log.warning(str)
        
    }
}
