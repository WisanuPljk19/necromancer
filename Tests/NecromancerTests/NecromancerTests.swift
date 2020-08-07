import XCTest
@testable import Necromancer

final class NecromancerTests: XCTestCase {
    
    func testConvertDateToString(){
        XCTAssertNotNil(DateUtils.toString(from: Date()), "new Date object must not be nil")
        XCTAssertNil(DateUtils.toString(from: nil), "new Date object must be nil")
    }
    
    func testConvertStringToDate(){
        XCTAssertNotNil(DateUtils.toDate(from: "05/08/2020",
                                         dateFormat: .dmy,
                                         localeDateTime: .en), "Match pattern dmy must not be nil")
        XCTAssertNil(DateUtils.toDate(from: "05/08/2020", dateFormat: .timestamp, localeDateTime: .en), "mismatch pattern timestamp must be nil")
        XCTAssertNil(DateUtils.toDate(from: "32/01/2020", dateFormat: .dmy, localeDateTime: .en), "invalid date string must be nil")
    }
    
    static var allTests = [
        ("testConvertDateToString", testConvertDateToString),
        ("testConvertStringToDate", testConvertStringToDate)
    ]
}
