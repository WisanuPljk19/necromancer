//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 30/9/2563 BE.
//

import Foundation


import XCTest
@testable import Necromancer

final class CalendarUtilsTests: XCTestCase {
    
    
    func  testDateTimeUtilsTotalDistance(){
        let dateStart = Necromancer.DateTimes.toDate(year: 2020,
                                                     month: 7,
                                                     day: 15,
                                                     hour: 0,
                                                     minute: 0,
                                                     second: 0,
                                                     timeZone: .current)
        let dateEnd = Necromancer.DateTimes.toDate(year: 2020,
                                                   month: 8,
                                                   day: 15,
                                                   hour: 0,
                                                   minute: 0,
                                                   second: 0,
                                                   timeZone: .current)
        let diffMonth = Necromancer.Calendars.totalDistance(_1st: dateStart!, _2nd: dateEnd!, resultIn: .month)
        let diffDay = Necromancer.Calendars.totalDistance(_1st: dateStart!, _2nd: dateEnd!, resultIn: .day)
        XCTAssertNotNil(diffMonth, "totalDistance must not be nil")
        XCTAssertTrue(diffMonth! == 1, "totalDistance must equal '1'")
        XCTAssertTrue(diffDay! == 31, "totalDistance must equal '31'")
    }
    
    func  testDateTimeUtilsCompare(){
        let dateStart = Necromancer.DateTimes.toDate(year: 2020,
                                                     month: 7,
                                                     day: 15)
        let dateEnd = Necromancer.DateTimes.toDate(year: 2020,
                                                   month: 8,
                                                   day: 15)
        let diffMonth = Necromancer.Calendars.compare(_1st: dateStart!, _2nd: dateEnd!, only: .month)
        let diffDay = Necromancer.Calendars.compare(_1st: dateStart!, _2nd: dateEnd!, only: .day)
        XCTAssertNotNil(diffMonth, "totalDistance must not be nil")
        XCTAssertTrue(diffMonth == -1, "totalDistance must equal '-1'")
        XCTAssertTrue(diffDay == 0, "totalDistance must equal '0'")
    }
    
    func testDateTimeUtilsIsSame(){
        let _1stDate = Necromancer.DateTimes.toDate(year: 2020,
                                                    month: 6,
                                                    day: 15)
        let _2ndDate = Necromancer.DateTimes.toDate(year: 2020,
                                                    month: 8,
                                                    day: 15)
        XCTAssertNotNil(_1stDate)
        XCTAssertNotNil(_2ndDate)
        XCTAssertTrue(Necromancer.Calendars.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .year))
        XCTAssertFalse(Necromancer.Calendars.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .month))
        XCTAssertTrue(Necromancer.Calendars.isSame(_1st: _1stDate!, _2nd: _2ndDate!, components: .day))
    }
    
    func testConvertADyearsToBEYears(){
        let adYears = 1993
        let beYears = Necromancer.Calendars.aDYearsToBEYears(adYears: adYears)
        XCTAssertNotNil(beYears, "beYears must not be nil")
        XCTAssertTrue(beYears == 2536, "1993 + 543 is 2536")
    }
    
    func testConvertBEYearsToADYears(){
        let beYears = 2536
        let adYears = Necromancer.Calendars.bEYearsToADYears(beYears: beYears)
        XCTAssertNotNil(adYears, "beYears must not be nil")
        XCTAssertTrue(adYears == 1993, "2536 - 543 is 1993")
    }
    
    func testCountOfWeekInMonth(){
        let countWeekFirstSunday = Necromancer.Calendars.countOfWeeksInMonth(from: 2020,
                                                                     month: .mar,
                                                                     firstWeekDay: .sunday)
        XCTAssertTrue(countWeekFirstSunday == 5, "2020-03 start in sunday count of week must be equal 5")
        let countWeekFirstMonday = Necromancer.Calendars.countOfWeeksInMonth(from: 2020,
                                                                     month: .mar,
                                                                     firstWeekDay: .monday)
        XCTAssertTrue(countWeekFirstMonday == 6, "2020-03 start in monday count of week must be equal 6")
        
        let countWeekFirstSundayNumber = Necromancer.Calendars.countOfWeeksInMonth(from: 2020,
                                                                           month: 3,
                                                                           firstWeekDay: 1)
        XCTAssertTrue(countWeekFirstSundayNumber == 5, "2020-03 start in sunday count of week must be equal 5")
        let countWeekFirstMondayNumber = Necromancer.Calendars.countOfWeeksInMonth(from: 2020,
                                                                           month: 3,
                                                                           firstWeekDay: 2)
        XCTAssertTrue(countWeekFirstMondayNumber == 6, "2020-03 start in monday count of week must be equal 6")
    }
    
    func testCountOfDayInMonth(){
        let countDayInFeb2020 = Necromancer.Calendars.countOfDayInMonth(from: 2020, month: .feb)
        XCTAssertTrue(countDayInFeb2020 == 29, "countOfDayInMonth of 2020-02 must be equal 29")
        let countDayInFeb2019 = Necromancer.Calendars.countOfDayInMonth(from: 2019, month: .feb)
        XCTAssertTrue(countDayInFeb2019 == 28, "countOfDayInMonth of 2019-02 must be equal 28")
    }
    
    func testDiffDate(){
        let toDay = Necromancer.DateTimes.toDate(year: 2020,
                                                     month: 7,
                                                     day: 15,
                                                     hour: 0,
                                                     minute: 0,
                                                     second: 0,
                                                     timeZone: .current)
        let lastDay = Necromancer.DateTimes.toDate(year: 2020,
                                                     month: 7,
                                                     day: 14,
                                                     hour: 0,
                                                     minute: 0,
                                                     second: 0,
                                                     timeZone: .current)
        
        let lastDayDiff = Necromancer.Calendars.diffDate(date: toDay!, day: -1)
        
        let diffDay = Necromancer.Calendars.totalDistance(_1st: lastDay!, _2nd: lastDayDiff, resultIn: .day)
        XCTAssertTrue(diffDay == 0, "diffDay of 2020-07-15 must be equal 0")
    }
    
}
