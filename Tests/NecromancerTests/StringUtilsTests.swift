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
        print(String.Index(utf16Offset: 1, in: "hello"))
        XCTAssertTrue(Necromancer.Strings.isNilOrEmpty(from: nil),
                      "input nil must be true")
        XCTAssertTrue(Necromancer.Strings.isNilOrEmpty(from: ""),
                      "input empty string must be true")
        XCTAssertFalse(Necromancer.Strings.isNilOrEmpty(from:
            "Hello Swift"), "input `Hello Swift` must be false")
    }
    
    func testStringIsNotNilOrEmpty(){
        XCTAssertFalse(Necromancer.Strings.isNotNilOrEmpty(from: nil),
                       "input nil must be false")
        XCTAssertFalse(Necromancer.Strings.isNotNilOrEmpty(from: ""),
                       "input empty string must be false")
        XCTAssertTrue(Necromancer.Strings.isNotNilOrEmpty(from: "Hello Swift"),
                      "input `Hello Swift` must be true")
    }
    
    func testSetValue(){
        XCTAssertNil(Necromancer.Strings.setValue(from: nil),
                     "input nil must be return nil")
        XCTAssertNil(Necromancer.Strings.setValue(from: ""),
                     "input empty string must be return nil")
        XCTAssertNotNil(Necromancer.Strings.isNotNilOrEmpty(from: "Hello Swift"),
                        "input `Hello Swift` must be return `Hello Swift`")
    }
    
    func testGetValue(){
        let str = "Hello Swift"
        XCTAssertTrue(Necromancer.Strings.getValue(from: nil) == "", "input nil must be return empty string")
        XCTAssertTrue(Necromancer.Strings.getValue(from: "") == "", "input empty string must be return empty string")
        XCTAssertTrue(Necromancer.Strings.getValue(from: str) == str, "input \"Hello Swift\" must be return \"Hello Swift\"")
    }
    
    func testConvertStringToInt(){
        let intValue = Necromancer.Strings.toInt(from: "23")
        XCTAssertNotNil(intValue, "input \"23\" must be not nil")
        XCTAssertTrue(intValue! == 23, "intValue must be 23")
        let intValidValue = Necromancer.Strings.toInt(from: "ABC")
        XCTAssertNil(intValidValue, "input \"ABC\" must be nil")
    }
    
    func testConvertStringToDouble(){
        let intDoubleValue = Necromancer.Strings.toInt(from: "23.525")
        XCTAssertNil(intDoubleValue, "input \"23.525\" must be nil")
        XCTAssertNil(Necromancer.Strings.toInt(from: nil), "input nil must be nil")
        let doubleValue = Necromancer.Strings.toDouble(from: "23.5")
        XCTAssertNotNil(doubleValue, "input \"23.5\" must be not nil")
        XCTAssertTrue(doubleValue! == 23.5, "intValue must be 23.5")
        let doubleValidValue = Necromancer.Strings.toDouble(from: "ABC")
        XCTAssertNil(doubleValidValue, "input \"ABC\" must be nil")
        let doubleIntValue = Necromancer.Strings.toDouble(from: "20")
        XCTAssertNotNil(doubleIntValue, "input \"20\" must be not nil")
        XCTAssertTrue(doubleIntValue! == 20.0, "intValue must be 20.0")
        XCTAssertNil(Necromancer.Strings.toDouble(from: nil), "input nil must be nil")
    }
    
    func testCheckRegEx(){
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "email@gmail.com", with: .email),
                      "right email must be true")
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "email@gmail..com", with: .email),
                      "right email must be true")
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "email@gmail.com", with: .email_efc5322),
                      "right email must be true")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "email@gmail..com", with: .email_efc5322),
                      "right email must be false")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: nil, with: .email),
                       "nil must be false")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "hellow this is me", with: .email),
                       "Mismatch email must be false")
        
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "0912345678", with: .mobile),
                      "right mobile must be true")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: nil, with: .mobile),
                       "nil must be false")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "abcdefghij", with: .mobile),
                       "Mismatch mobile must be false")
        
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "21.2", with: .decimal),
                      "right decimal must be true")
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "12374", with: .decimal),
                      "right number i decimal")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: nil, with: .decimal),
                       "nil must be false")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "abcdefghij", with: .decimal),
                       "Mismatch mobile must be false")
        
        XCTAssertTrue(Necromancer.Strings.checkRegEx(from: "12374", with: .number),
                      "right number must be true")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "124.231", with: .number),
                      "decimal is not number")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: nil, with: .number),
                       "nil must be false")
        XCTAssertFalse(Necromancer.Strings.checkRegEx(from: "abcdefghij", with: .number),
                       "Mismatch mobile must be false")
    }
    
    func testValidateTextfield(){
        XCTAssertFalse(Necromancer.Strings.validateTextField(from: nil,
                                                     with: .default,
                                                     limit: 100,
                                                     isRequire: true),
                       "input nil and isRequire must be return false")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: nil,
                                                    with: .default,
                                                    limit: 100,
                                                    isRequire: false),
                      "input nil and isNotRequire must be return true")
        XCTAssertFalse(Necromancer.Strings.validateTextField(from: "abcdefg1234567890",
                                                     with: .default,
                                                     limit: 5,
                                                     isRequire: true),
                       "input string count > limit must be return false")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "abcdefg1234567890",
                                                    with: .default,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string count < limit must be return false")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "123456789011121314",
                                                    with: .numberPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string number and keyboard type .numberPad must be return true")
        XCTAssertFalse(Necromancer.Strings.validateTextField(from: "abcdefg1234567890",
                                                     with: .numberPad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .numberPad must be return false")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "123456789011121314",
                                                    with: .decimalPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string number and keyboard type .numberPad must be return true")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "1234.123213",
                                                    with: .decimalPad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string decimal and keyboard type .numberPad must be return true")
        XCTAssertFalse(Necromancer.Strings.validateTextField(from: "abcdefg1234567890",
                                                     with: .decimalPad,
                                                     limit: 100,
                                                     isRequire: true),
                       "input string and keyboard type .numberPad must be return false")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "email@email.com",
                                                    with: .emailAddress,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string email and keyboard type .emailAddress must be return true")
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "0991234567",
                                                    with: .phonePad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string phone and keyboard type .phonePad must be return true")
        
        XCTAssertTrue(Necromancer.Strings.validateTextField(from: "abcdefg1234567890",
                                                    with: .namePhonePad,
                                                    limit: 100,
                                                    isRequire: true),
                      "input string phone and keyboard type .namePhonePad must be return true because regEx = .none")
    }
    
    func testIsCompose(){
        let stringEn = "Hello Swift"
        XCTAssertFalse(Necromancer.Strings.isCompose(from: nil, with: "Sw"), "string nil must be return nil")
        XCTAssertTrue(Necromancer.Strings.isCompose(from: stringEn, with: "Sw"),
                      "string `Hello Swift` and check `Sw` must be return true")
        XCTAssertFalse(Necromancer.Strings.isCompose(from: stringEn, with: "sw"),
        "string `Hello Swift` and check `sw` must be return false")
        
        let stringTh = "สวัสดี สวิฟท์"
        XCTAssertFalse(Necromancer.Strings.isCompose(from: nil, with: "สวิ"), "string nil must be return nil")
        XCTAssertTrue(Necromancer.Strings.isCompose(from: stringTh, with: "สวิ"),
                      "string `สวัสดี สวิฟท์` and check `สวิ` must be return true")
        XCTAssertFalse(Necromancer.Strings.isCompose(from: stringTh, with: "สวส"),
        "string `สวัสดี สวิฟท์` and check `สวส` must be return false")
    }
    
    func testSubstring(){
        let str = "Hello Work My Swift Language"
        XCTAssertNil(Necromancer.Strings.substring(from: str, beginIndex: 500, endIndex: 5000))
        XCTAssertNotNil(Necromancer.Strings.substring(from: str, beginIndex: 0, endIndex: 5))
        XCTAssertTrue(Necromancer.Strings.substring(from: str, beginIndex: 0, endIndex: 5) == "Hello")
        
        XCTAssertNil(Necromancer.Strings.substring(from: str, beginIndex: -5))
        XCTAssertNotNil(Necromancer.Strings.substring(from: str, beginIndex: 0))
        XCTAssertTrue(Necromancer.Strings.substring(from: str, beginIndex: 0) == str)

        XCTAssertNil(Necromancer.Strings.substring(from: str, endIndex: 5000))
        XCTAssertNotNil(Necromancer.Strings.substring(from: str, endIndex: 5))
        XCTAssertTrue(Necromancer.Strings.substring(from: str, endIndex: 5) == "Hello")
    }
    
    func testPetternFormatString(){
        let idCard = "1100765298123"
        XCTAssertNotNil(Necromancer.Strings.applyPatternOnNumbers(idCard, with: "#-####-#####-##-#", and: "#"))
        let accountNo = "0010976209"
        XCTAssertNotNil(Necromancer.Strings.applyPatternOnNumbers(accountNo, with: "###-#-######", and: "#"))
    }
    
    func testConcatString(){
        let strings: [String?] = ["Hello", nil, "Swift"]
        XCTAssertTrue(Necromancer.Strings.concat(from: strings, separator: ",").split(separator: ",").count == 2)
    }
    
    func testToStringFromInt(){
        var int5: Int? = 5
        var double5_55: Double? = 5.55

        XCTAssertTrue(Necromancer.Strings.toString(from: int5) == "5")
        XCTAssertTrue(Necromancer.Strings.toStringWithoutEmpty(from: int5) == "5")
        XCTAssertTrue(Necromancer.Strings.toString(from: double5_55) == "5.55")
        XCTAssertTrue(Necromancer.Strings.toStringWithoutEmpty(from: double5_55) == "5.55")
        
        int5 = nil
        double5_55 = nil
        XCTAssertTrue(Necromancer.Strings.toString(from: int5) == "")
        XCTAssertTrue(Necromancer.Strings.toStringWithoutEmpty(from: int5) == nil)
        XCTAssertTrue(Necromancer.Strings.toString(from: double5_55) == "")
        XCTAssertTrue(Necromancer.Strings.toStringWithoutEmpty(from: double5_55) == nil)
    }
}
