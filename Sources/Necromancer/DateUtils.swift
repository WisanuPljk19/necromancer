//
//  DateUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 7/8/2563 BE.
//

import Foundation

public class DateUtils {
    
    /**
    Enumerate of Locale Date Time
     *Values*
     
     `th` = th_TH
     
     `en` = en_US_POSIX
     
    */
    
    public enum LocaleDateTime {
        case th
        case en
        
        var locale: Locale {
            switch self {
            case .th:
                return Locale(identifier: "th_TH")
            case .en:
                return Locale(identifier: "en_US_POSIX")
            }
        }
    }
    
    /**
     Enumerate of Date Format Patternn
     
     *Values*
     
     `dmy` = dd/MM/yyyy ex. 07/08/2020
     
     `timestamp` = yyyy-MM-dd'T'HH:mm:ss ex. 2020-08-07T15:41:23
     
     `timestampDisplay` = dd/MM/yyyy HH:mm ex. 2020-08-07 15:41:23
     
     `fullDateTime` = "EEE, d MMM yyyy HH:mm:ss Z" ex. Friday, 8 August 2020 15:41:23 +0700
     
     `onlyTime` = HH:mm:ss ex. 15:41:23
     
     `onlyTimeWithOutSec` = HH:mm ex. 15:41
     
     `fullMonthAndFullYear` = MMMM yyyy ex. August 2020
     
     `fullShortDate` = EEEE d MMMM yyyy ex. Friday 7 August 2020
     
     `shortDate` = d MMMM yyyy ex. 8 August 2020
     
     `shortMonthAndShortYear` = MMM yy ex. Aug 20
     
     - Author:
     wisanu.pljk
     */
    public enum DateFormat {
        case dmy
        case timestamp
        case timestampDisplay
        case fullDateTime
        case onlyTime
        case onlyTimeWithOutSec
        case fullMonthAndFullYear
        case fullShortDate
        case shortDate
        case shortMonthAndShortYear
        
        var format: String {
            switch self {
            case .dmy:
                return "dd/MM/yyyy"
            case .timestamp:
                return "yyyy-MM-dd'T'HH:mm:ss"
            case .timestampDisplay:
                return "dd/MM/yyyy HH:mm"
            case .fullDateTime:
                return "EEE, d MMM yyyy HH:mm:ss Z"
            case .onlyTime:
                return "HH:mm:ss"
            case .onlyTimeWithOutSec:
                return "HH:mm"
            case .fullMonthAndFullYear:
                return "MMMM yyyy"
            case .fullShortDate:
                return "EEEE d MMMM yyyy"
            case .shortDate:
                return "d MMMM yyyy"
            case .shortMonthAndShortYear:
                return "MMM yy"
            }
        }
    }
    
    /**

     - Description
     Convert `String` to `Date` with date format pattern and local date time
     
     ex.  input 07/08/2020 ->  Friday, 7th August 2020 in dateFormat  = dmy, localeDateTime = en
     
     - Parameters:
        - string: string date input
        - dateFormat: pattern of string date input
        - localeDateTime: local of string date input
     
     - Returns:
        - Date?: Date object with optional
     
     - Author:
     wisanu.pljk
     */
    class func toDate(from string: String?,
                      dateFormat: DateFormat = .timestamp,
                      localeDateTime: LocaleDateTime = .en) -> Date? {
        guard let dateString = string else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = localeDateTime.locale
        formatter.dateFormat = dateFormat.format
        return formatter.date(from: dateString)
    }
    
    /**

    - Description
    Convert `Date` to `String` with date format pattern and local date time
    
    ex.  Friday, 7th August 2020 -> 07/08/2020 in dateFormat  = dmy, localeDateTime = en
    
    - Parameters:
       - date: Date Object input
       - dateFormat: pattern of string date input
       - localeDateTime: local of string date input
    
    - Returns:
       - String?: String date with optional
    
    - Author:
    wisanu.pljk
    */
    class func toString(from date: Date?,
                        dateFormat: DateFormat = .timestamp,
                        localeDateTime: LocaleDateTime = .en) -> String? {
        guard let date = date else {
            return nil
        }
        let formatter = DateFormatter()
        formatter.locale = localeDateTime.locale
        formatter.dateFormat = dateFormat.format
        return formatter.string(from: date)
    }
}
