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
        - locale: locale of string date input, default is Locale.current
        - timeZone: time zone of string date input, default is TimeZone.current
     
     - Returns:
        - Date?: Date object with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toDate(from string: String?,
                             with format: DateFormat,
                             locale: Locale = Necromancer.locale,
                             timeZone: TimeZone = Necromancer.timeZone) -> Date? {
        guard let dateString = string else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.dateFormat = format.format
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
        - timeZone: time zone of input
     
     - Returns:
        - Date?: Date object with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toDate(year: Int? = nil,
                             month: Int? = nil,
                             day: Int? = nil,
                             hour: Int? = nil,
                             minute: Int? = nil,
                             second: Int? = nil,
                             identifier: Calendar.Identifier = Necromancer.identifier,
                             timeZone: TimeZone = Necromancer.timeZone) -> Date?{
        let calendar = Calendar.init(identifier: identifier)
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
        - locale: locale of string date input, default is Locale.current
        - timeZone: time zone of string date input, default is TimeZone.current
     
     - Returns:
        - String?: String date with optional
     
     - Author:
     wisanu.pljk
     */
    public class func toString(from date: Date?,
                               with format: DateFormat = .timestamp,
                               locale: Locale = Necromancer.locale,
                               timeZone: TimeZone = Necromancer.timeZone) -> String? {
        guard let date = date else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = locale
        formatter.timeZone = timeZone
        formatter.dateFormat = format.format
        return formatter.string(from: date)
    }
    
    /**
     
     - Description
     Strip time of date
    
     ex.  07/08/2020 18:00:00 GMT+7 -> 07/08/2020 00:00:00 GMT+7
     
     - Parameters:
        - date: Date Object input
        - locale: locale of string date input, default is Locale.current
        - timeZone: time zone of string date input, default is TimeZone.current
     
     - Returns:
        - Date?: date after strip time
     
     - Author:
     wisanu.pljk
     */
    public class func stripTime(with date: Date?,
                                identifier: Calendar.Identifier = Necromancer.identifier,
                                timeZone: TimeZone = Necromancer.timeZone) -> Date? {
        
        guard let date = date else {
            return nil
        }
        let calendar = Calendar.init(identifier: identifier)
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return  DateTimeUtils.toDate(year: components.year,
                                     month: components.month,
                                     day: components.day,
                                     hour: 0,
                                     minute: 0,
                                     second: 0,
                                     identifier: identifier,
                                     timeZone: timeZone)
    }
}
