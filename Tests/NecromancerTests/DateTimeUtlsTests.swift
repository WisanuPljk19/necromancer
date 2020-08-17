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
        XCTAssertNotNil(DateTimeUtils.toString(from: Date()), "new Date object must not be nil")
        XCTAssertNotNil(DateTimeUtils.toString(from: Date(), dateFormat: .onlyTime),
                        "new Date object must not be nil")
        XCTAssertNotNil(DateTimeUtils.toString(from: Date(), dateFormat: .onlyTimeWithOutSec),
                        "new Date object must not be nil")
        XCTAssertNotNil(DateTimeUtils.toString(from: Date(), dateFormat: .fullMonthAndFullYear),
                        "new Date object must not be nil")
        XCTAssertNotNil(DateTimeUtils.toString(from: Date(), dateFormat: .shortMonthAndShortYear),
                        "new Date object must not be nil")
        XCTAssertNil(DateTimeUtils.toString(from: nil), "new Date object must be nil")
    }
    
    func testConvertStringToDate(){
        XCTAssertNil(DateTimeUtils.toDate(from: nil,
                                          dateFormat: .timestamp,
                                          locale: LocaleDateTime.en,
                                          timeZone: .current), "input nil must be nil")
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
        XCTAssertNotNil(DateTimeUtils.toDate(from: "05/08/2020 11:13",
                                             dateFormat: .timestampDisplay,
                                             locale: LocaleDateTime.en,
                                             timeZone: .current), "Match pattern dmy must not be nil")
        XCTAssertNotNil(DateTimeUtils.toDate(from: "Friday, 14 August 2020 11:14:25 +0700",
                                             dateFormat: .fullDateTime,
                                             locale: LocaleDateTime.en,
                                             timeZone: .current), "Match pattern dmy must not be nil")
        XCTAssertNotNil(DateTimeUtils.toDate(from: "Friday 8 August 2020",
                                             dateFormat: .fullShortDate,
                                             locale: LocaleDateTime.en,
                                             timeZone: .current), "Match pattern dmy must not be nil")
        XCTAssertNotNil(DateTimeUtils.toDate(from: "8 August 2020",
                                             dateFormat: .shortDate,
                                             locale: LocaleDateTime.en,
                                             timeZone: .current), "Match pattern dmy must not be nil")
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
    
    func testConvertADyearsToBEYears(){
        let adYears = 1993
        let beYears = DateTimeUtils.convertADYearsToBEYears(adYears)
        XCTAssertNotNil(beYears, "beYears must not be nil")
        XCTAssertTrue(beYears == 2536, "1993 + 543 is 2536")
    }
    
    func testConvertBEYearsToADYears(){
        let beYears = 2536
        let adYears = DateTimeUtils.convertBEYearsToADYears(beYears)
        XCTAssertNotNil(adYears, "beYears must not be nil")
        XCTAssertTrue(adYears == 1993, "2536 - 543 is 1993")
    }
    
    func testCountOfWeekInMonth(){
        let countWeekFirstSunday = DateTimeUtils.countOfWeeksInMonth(from: 2020,
                                                              month: .mar,
                                                              identifier: .gregorian,
                                                              firstWeekDay: .sunday)
        XCTAssertTrue(countWeekFirstSunday == 5, "2020-03 start in sunday count of week must be equal 5")
        let countWeekFirstMonday = DateTimeUtils.countOfWeeksInMonth(from: 2020,
                                                              month: .mar,
                                                              identifier: .gregorian,
                                                              firstWeekDay: .monday)
        XCTAssertTrue(countWeekFirstMonday == 6, "2020-03 start in monday count of week must be equal 6")
        
        let countWeekFirstSundayNumber = DateTimeUtils.countOfWeeksInMonth(from: 2020,
                                                              month: 3,
                                                              identifier: .gregorian,
                                                              firstWeekDay: 1)
        XCTAssertTrue(countWeekFirstSundayNumber == 5, "2020-03 start in sunday count of week must be equal 5")
        let countWeekFirstMondayNumber = DateTimeUtils.countOfWeeksInMonth(from: 2020,
                                                              month: 3,
                                                              identifier: .gregorian,
                                                              firstWeekDay: 2)
        XCTAssertTrue(countWeekFirstMondayNumber == 6, "2020-03 start in monday count of week must be equal 6")
    }
    
    func testCountOfDayInMonth(){
        let countDayInFeb2020 = DateTimeUtils.countOfDayInMonth(from: 2020, month: .feb, identifier: .gregorian)
        XCTAssertTrue(countDayInFeb2020 == 29, "countOfDayInMonth of 2020-02 must be equal 29")
        let countDayInFeb2019 = DateTimeUtils.countOfDayInMonth(from: 2019, month: .feb, identifier: .gregorian)
        XCTAssertTrue(countDayInFeb2019 == 28, "countOfDayInMonth of 2019-02 must be equal 28")
    }
    
    static var allTests = [
        ("testConvertDateToString", testConvertDateToString),
        ("testConvertStringToDate", testConvertStringToDate),
        ("testInitialDateFromComponent", testInitialDateFromComponent),
        ("testDateTimeUtilsTotalDistance", testDateTimeUtilsTotalDistance),
        ("testDateTimeUtilsCompare", testDateTimeUtilsCompare),
        ("testDateTimeUtilsIsSame", testDateTimeUtilsIsSame)
    ]
}
