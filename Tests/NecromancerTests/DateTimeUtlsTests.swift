//
//  DateTimeUtlsTests.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import XCTest
@testable import Necromancer

final class DateTimeUtlsTests: XCTestCase {
    
    func testConvertDateToString(){
        XCTAssertNotNil(Necromancer.DateTimes.toString(from: Date()), "new Date object must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toString(from: Date(), with: .onlyTime),
                        "new Date object must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toString(from: Date(), with: .onlyTimeWithOutSec),
                        "new Date object must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toString(from: Date(), with: .fullMonthAndFullYear),
                        "new Date object must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toString(from: Date(), with: .shortMonthAndShortYear),
                        "new Date object must not be nil")
        XCTAssertNil(Necromancer.DateTimes.toString(from: nil), "new Date object must be nil")
    }
    
    func testConvertStringToDate(){
        XCTAssertNil(Necromancer.DateTimes.toDate(from: nil,
                                          with: .timestamp,
                                          locale: LocaleDateTime.en), "input nil must be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "05/08/2020",
                                             with: .dmy,
                                             locale: LocaleDateTime.en), "Match pattern dmy must not be nil")
        XCTAssertNil(Necromancer.DateTimes.toDate(from: "05/08/2020",
                                          with: .timestamp,
                                          locale: LocaleDateTime.en), "mismatch pattern timestamp must be nil")
        XCTAssertNil(Necromancer.DateTimes.toDate(from: "32/01/2020",
                                          with: .dmy,
                                          locale: LocaleDateTime.en), "invalid date string must be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "05/08/2020 11:13",
                                             with: .timestampDisplay,
                                             locale: LocaleDateTime.en), "Match pattern dmy must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "Friday, 14 August 2020 11:14:25 +0700",
                                             with: .fullDateTime,
                                             locale: LocaleDateTime.en), "Match pattern dmy must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "Friday 8 August 2020",
                                             with: .fullShortDate,
                                             locale: LocaleDateTime.en), "Match pattern dmy must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "8 August 2020",
                                             with: .shortDate,
                                             locale: LocaleDateTime.en), "Match pattern dmy must not be nil")
        XCTAssertNotNil(Necromancer.DateTimes.toDate(from: "2000-10-20T00:00:00.000+07:00",
                                             with: .isoDate,
                                             locale: LocaleDateTime.en,
                                             timeZone: TimeZoneDateTime.bangkok), "Match pattern isoDate must not be nil")
    }
    
    func testInitialDateFromComponent(){
        let dateCurrentTimeGregorian = Necromancer.DateTimes.toDate(year: 2020,
                                                            month: 8,
                                                            day: 11,
                                                            hour: 0,
                                                            minute: 0,
                                                            second: 0)
        
        XCTAssertNotNil(dateCurrentTimeGregorian, "New date with gregorian component must not be nil ")
        
        let dateCurrentTimeBuddhist = Necromancer.DateTimes.toDate(year: 2563,
                                                           month: 8,
                                                           day: 11,
                                                           hour: 0,
                                                           minute: 0,
                                                           second: 0,
                                                           identifier: .buddhist)
        
        XCTAssertNotNil(dateCurrentTimeBuddhist, "New date with buddhist component must not be nil ")
        
        XCTAssertTrue(dateCurrentTimeGregorian!.compare(dateCurrentTimeBuddhist!).rawValue == 0, "compare date must valid")
    }
    
    func testStripTime(){
        let now = Date()
        let dateComponent = Necromancer.DateTimes.toDate(year: 2021,
                                                           month: 1,
                                                           day: 14,
                                                           hour: 0,
                                                           minute: 0,
                                                           second: 0)
        
        XCTAssertTrue(DateTimeUtils.stripTime(with: now) == dateComponent, "compare date must valid")
    }
    
    static var allTests = [
        ("testConvertDateToString", testConvertDateToString),
        ("testConvertStringToDate", testConvertStringToDate),
        ("testInitialDateFromComponent", testInitialDateFromComponent)
    ]
}
