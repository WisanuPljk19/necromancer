//
//  DateUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 7/8/2563 BE.
//

import Foundation

public class DateTimeUtils {
    
    /**
     
     - Description
     Convert `String` to `Date` with date format pattern and local date time
     
     ex.  input 07/08/2020 ->  Friday, 7th August 2020 in dateFormat  = dmy, localeDateTime = en
     
     - Parameters:
        - string: string date input
        - dateFormat: pattern of string date input
        - localeDateTime: local of string date input
        - timeZone: time zone of string date input
     
     - Returns:
        - Date?: Date object with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toDate(from string: String?,
                             dateFormat: DateFormat = .timestamp,
                             locale: Locale = .current,
                             timeZone: TimeZone = .current) -> Date? {
        guard let dateString = string else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = dateFormat.format
        formatter.timeZone = timeZone
        return formatter.date(from: dateString)
    }
    
    /**
     
     - Description
     Initial `Date` with component
     
     - Parameters:
        - year: year date input
        - month: month of year date input
        - day: day of month date input
        - hour: hour input
        - minute: hour input
        - second: second input
        - identifier: Identifier of calendar (Calendar.Identifier) ex. gregorian, buddhist
        - localeDateTime: local of input
        - timeZone: time zone of input
     
     - Returns:
        - Date?: Date object with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toDate(year: Int?,
                             month: Int?,
                             day: Int?,
                             hour: Int?,
                             minute: Int?,
                             second: Int?,
                             identifier: Calendar.Identifier = .gregorian,
                             locale: Locale = .current,
                             timeZone: TimeZone = .current) -> Date?{
        
        var calendar = Calendar.init(identifier: identifier)
        calendar.locale = locale
        
        let dateComponent = DateComponents(calendar: calendar,
                                           timeZone: timeZone,
                                           year: year,
                                           month: month,
                                           day: day,
                                           hour: hour,
                                           minute: minute,
                                           second: second)
        return dateComponent.date
        
    }
    
    /**
     
     - Description
     Convert `Date` to `String` with date format pattern and local date time
     
     ex.  Friday, 7th August 2020 -> 07/08/2020 in dateFormat  = dmy, localeDateTime = en
     
     - Parameters:
        - date: Date Object input
        - dateFormat: pattern of string date output
        - localeDateTime: local of string date output
        - timeZone: time zone of string date output
     
     - Returns:
        - String?: String date with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toString(from date: Date?,
                               dateFormat: DateFormat = .timestamp,
                               locale: Locale = .current,
                               timeZone: TimeZone = .current) -> String? {
        guard let date = date else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timeZone
        formatter.dateFormat = dateFormat.format
        return formatter.string(from: date)
    }
    
    /**
     
     - Description
     Calculate distance between date and date
     
     - Parameters:
        - _1st: Date object start
        - _2nd: Date object end
        - resultIn: component of date ex. year, month
     
     - Returns:
        - Int?: result of calculate distance
     
     - Author:
     wisanu.pljk
     */
    public class func totalDistance(_1st _1stDate: Date,
                                    _2nd _2ndDate: Date,
                                    resultIn component: Calendar.Component) -> Int? {
        return Calendar
            .current
            .dateComponents([component], from: _1stDate, to: _2ndDate)
            .value(for: component)
    }
    
    /**
     
     - Description
     compare between date and date with componennt
     
     - Parameters:
        - _1st: Date object first
        - _2nd: Date object second
        - only: component of date ex. year, month
     
     - Returns:
        - Int?: result of compare
     
     - Author:
     wisanu.pljk
     */
    public class func compare(_1st _1stDate: Date,
                              _2nd _2ndDate: Date,
                              only component: Calendar.Component) -> Int {
        let date1 = Calendar.current.component(component, from: _1stDate)
        let date2 = Calendar.current.component(component, from: _2ndDate)
        return date1 - date2
    }
    
    /**
     
     - Description
     compare between date and date with componennts
     
     - Parameters:
        - _1st: Date object first
        - _2nd: Date object second
        - components: components of date ex. [year, month]
     
     - Returns:
        - Bool: return date is same components
     
     - Author:
     wisanu.pljk
     */
    public class func isSame(_1st _1stDate: Date,
                             _2nd _2ndDate: Date,
                             components: Calendar.Component...) -> Bool {
        
        var isSame = true
        
        components.forEach { component in
            if compare(_1st: _1stDate, _2nd: _2ndDate, only: component) != 0 {
                isSame = false
                return
            }
        }
        
        return isSame
    }
    
    /**
     
     - Description
     Convert `A.D. Years` to `B.E. Years`
     
     - Parameters:
        - adYears: A.D. Years Input
     
     - Returns:
        - Int?: B.E Years
     
     - Author:
     wisanu.pljk
     */
    public class func convertADYearsToBEYears(_ adYears: Int?) -> Int? {
        guard let adYears = adYears else {
            return nil
        }
        
        guard let adDate = toDate(year: adYears,
                                  month: 1,
                                  day: 1,
                                  hour: 0,
                                  minute: 0,
                                  second: 0,
                                  identifier: .gregorian,
                                  locale: .current,
                                  timeZone: .current) else {
                                    return nil
        }
        
        let calendar = Calendar.init(identifier: .buddhist)
        let beYears = calendar.component(.year, from: adDate)
        
        return beYears
    }
    
    /**
     
     - Description
     Convert `B.E. Years` to `A.D. Years`
     
     - Parameters:
        - beYears: B.E. Years
     
     - Returns:
        - Int?: A.D. Years
     
     - Author:
     wisanu.pljk
     */
    public class func convertBEYearsToADYears(_ beYears: Int?) -> Int? {
        guard let beYears = beYears else {
            return nil
        }
        
        guard let beDate = toDate(year: beYears,
                                  month: 1,
                                  day: 1,
                                  hour: 0,
                                  minute: 0,
                                  second: 0,
                                  identifier: .buddhist,
                                  locale: .current,
                                  timeZone: .current) else {
                                    return nil
        }
        
        let calendar = Calendar.init(identifier: .gregorian)
        let adYears = calendar.component(.year, from: beDate)
        
        return adYears
    }
    
    /**
    
    - Description
    Count  of week in month
    
    - Parameters:
        - year: year input
        - month: `Month Enum`  input ex. `Month.jan`
        - identifier: Identifier of calendar (Calendar.Identifier) ex. gregorian, buddhist
        - firstWeekDay: `Day Enum` start day of week in month ex. `Day.sunday`
    
    - Returns:
        - Int?: Count of week in month
    
    - Author:
    wisanu.pljk
    */
    public class func countOfWeeksInMonth(from year: Int,
                                   month: Month,
                                   identifier: Calendar.Identifier = .gregorian,
                                   firstWeekDay: Day = .sunday) -> Int {
        return countOfWeeksInMonth(from: year,
                            month: month.rawValue,
                            identifier: identifier,
                            firstWeekDay: firstWeekDay.rawValue)
    }
    
    /**
    
    - Description
    Count  of week in month
    
    - Parameters:
        - year: year input
        - month: number of month in year  input ex. `1` is January
        - identifier: Identifier of calendar (Calendar.Identifier) ex. gregorian, buddhist
        - firstWeekDay: number of day in week input ex. `1` is Sunday
    
    - Returns:
        - Int?: Count of week in month
    
    - Author:
    wisanu.pljk
    */
    public class func countOfWeeksInMonth(from year: Int,
                                   month: Int,
                                   identifier: Calendar.Identifier = .gregorian,
                                   firstWeekDay: Int) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        var calendar = Calendar(identifier: identifier)
        calendar.firstWeekday = firstWeekDay
        let date = calendar.date(from: dateComponents)!
        let weekRange = calendar.range(of: .weekOfMonth,
                                       in: .month,
                                       for: date)
        return weekRange!.count
    }
    
    /**
    
    - Description
    Count  of day in month
    
    - Parameters:
        - year: year input
        - month: `Month Enum`  input ex. `Month.jan`
        - identifier: Identifier of calendar (Calendar.Identifier) ex. gregorian, buddhist
    
    - Returns:
        - Int?: Count  of day in month
    
    - Author:
    wisanu.pljk
    */
    public class func countOfDayInMonth(from year: Int,
                                        month: Month,
                                        identifier: Calendar.Identifier = .gregorian) -> Int {
        return countOfDayInMonth(from: year, month: month.rawValue, identifier: identifier)
    }
    
    /**
    
    - Description
    Count  of day in month
    
    - Parameters:
        - year: year input
        - month: number of month in year  input ex. `1` is January
        - identifier: Identifier of calendar (Calendar.Identifier) ex. gregorian, buddhist
    
    - Returns:
        - Int?: Count  of day in month
    
    - Author:
    wisanu.pljk
    */
    public class func countOfDayInMonth(from year: Int,
                                         month: Int,
                                         identifier: Calendar.Identifier = .gregorian) -> Int {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar(identifier: identifier)
        let date = calendar.date(from: dateComponents)!
        let range = calendar.range(of: .day, in: .month, for: date)!
        return range.count
    }
}
