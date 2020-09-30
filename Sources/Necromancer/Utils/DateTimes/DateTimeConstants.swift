//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 11/8/2563 BE.
//

import Foundation

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
    case isoDate
    
    var format: String {
        switch self {
        case .dmy:
            return "dd/MM/yyyy"
        case .timestamp:
            return "yyyy-MM-dd'T'HH:mm:ss"
        case .timestampDisplay:
            return "dd/MM/yyyy HH:mm"
        case .fullDateTime:
            return "EEE, d MMMM yyyy HH:mm:ss Z"
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
        case .isoDate:
            return "yyyy-MM-dd'T'HH:mm:ss.SSSXXX"
        }
    }
}

public enum TimeZoneDateTime {
    public static let utc = TimeZone(abbreviation: "UTC")!
    public static let bangkok = TimeZone(identifier: "Asia/Bangkok")!
    public static let london = TimeZone(identifier: "Europe/London")!
    public static let tokyo = TimeZone(identifier: "Asia/Tokyo")!
    public static let newYork = TimeZone(identifier: "America/New_York")!
    public static let losAngeles = TimeZone(identifier: "America/Los_Angeles")!
}

public enum LocaleDateTime {
    public static let th = Locale(identifier: "th_TH")
    public static let en = Locale(identifier: "en_US_POSIX")
}
