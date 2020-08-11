import XCTest
@testable import Necromancer

final class NecromancerTests: XCTestCase {
    
    func testConvertDateToString(){
        XCTAssertNotNil(DateTimeUtils.toString(from: Date()), "new Date object must not be nil")
        XCTAssertNil(DateTimeUtils.toString(from: nil), "new Date object must be nil")
    }
    
    func testConvertStringToDate(){
        XCTAssertNotNil(DateTimeUtils.toDate(from: "05/08/2020",
                                         dateFormat: .dmy,
                                         locale: LocaleDateTime.en,
                                         timeZone: .current), "Match pattern dmy must not be nil")
        XCTAssertNil(DateTimeUtils.toDate(from: "05/08/2020",
                                          dateFormat: .timestamp,
                                          locale: LocaleDateTime.en,
                                          timeZone: .current), "mismatch pattern timestamp must be nil")
        XCTAssertNil(DateTimeUtils.toDate(from: "32/01/2020",
                                          dateFormat: .dmy,
                                          locale: LocaleDateTime.en,
                                          timeZone: .current), "invalid date string must be nil")
    }
    
    func testInitialDateFromComponent(){
        let dateCurrentTimeGregorian = DateTimeUtils.toDate(year: 2020,
                         month: 8,
                         day: 11,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        
        XCTAssertNotNil(dateCurrentTimeGregorian, "New date with gregorian component must not be nil ")
        
        let dateCurrentTimeBuddhist = DateTimeUtils.toDate(year: 2563,
                         month: 8,
                         day: 11,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .buddhist,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        
        XCTAssertNotNil(dateCurrentTimeBuddhist, "New date with buddhist component must not be nil ")
        
        XCTAssertTrue(dateCurrentTimeGregorian!.compare(dateCurrentTimeBuddhist!).rawValue == 0, "compare date must valid")
    }
    
    func  testDateTimeUtilsTotalDistance(){
        let dateStart = DateTimeUtils.toDate(year: 2020,
                         month: 7,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        let dateEnd = DateTimeUtils.toDate(year: 2020,
                         month: 8,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        let diffMonth = DateTimeUtils.totalDistance(_1st: dateStart!, _2nd: dateEnd!, resultIn: .month)
        let diffDay = DateTimeUtils.totalDistance(_1st: dateStart!, _2nd: dateEnd!, resultIn: .day)
        XCTAssertNotNil(diffMonth, "totalDistance must not be nil")
        XCTAssertTrue(diffMonth! == 1, "totalDistance must equal '1'")
        XCTAssertTrue(diffDay! == 31, "totalDistance must equal '31'")
    }
    
    func  testDateTimeUtilsCompare(){
        let dateStart = DateTimeUtils.toDate(year: 2020,
                         month: 7,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        let dateEnd = DateTimeUtils.toDate(year: 2020,
                         month: 8,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        let diffMonth = DateTimeUtils.compare(_1st: dateStart!, _2nd: dateEnd!, only: .month)
        let diffDay = DateTimeUtils.compare(_1st: dateStart!, _2nd: dateEnd!, only: .day)
        XCTAssertNotNil(diffMonth, "totalDistance must not be nil")
        XCTAssertTrue(diffMonth == -1, "totalDistance must equal '-1'")
        XCTAssertTrue(diffDay == 0, "totalDistance must equal '0'")
    }
    
    func testDateTimeUtilsIsSame(){
        let _1stDate = DateTimeUtils.toDate(year: 2020,
                         month: 6,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        let _2ndDate = DateTimeUtils.toDate(year: 2020,
                         month: 8,
                         day: 15,
                         hour: 0,
                         minute: 0,
                         second: 0,
                         identifier: .gregorian,
                         locale: LocaleDateTime.en,
                         timeZone: .current)
        XCTAssertNotNil(_1stDate)
        XCTAssertNotNil(_2ndDate)
        XCTAssertTrue(DateTimeUtils.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .year))
        XCTAssertFalse(DateTimeUtils.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .month))
        XCTAssertTrue(DateTimeUtils.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .day))
    }
    
    static var allTests = [
        ("testConvertDateToString", testConvertDateToString),
        ("testConvertStringToDate", testConvertStringToDate)
    ]
}
