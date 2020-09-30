//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 30/9/2563 BE.
//

import Foundation

public enum Day: Int {
    case sunday = 1, monday, tuesday, wednesday, thursday, friday, saturay
    
    static func initialFrom(_ value: Int?) -> Day? {
        guard let value = value else {
            return nil
        }
        return Day(rawValue: value)
    }
    
    static var current: Day {
        return Day(rawValue: Calendar.current.component(.weekday, from: Date()))!
    }
    
    var nameTH: String {
        switch self {
        case .sunday:
            return "อาทิตย์"
        case .monday:
            return "จันทร์"
        case .tuesday:
            return "อังคาร"
        case .wednesday:
            return "พุธ"
        case .thursday:
            return "พฤหัสบดี"
        case .friday:
            return "ศุกร์"
        case .saturay:
            return "เสาร์"
        }
    }
    
    var abbreviationsTH: String {
        switch self {
        case .sunday:
            return "อา."
        case .monday:
            return "จ."
        case .tuesday:
            return "อ."
        case .wednesday:
            return "พ."
        case .thursday:
            return "พฤ."
        case .friday:
            return "ศ."
        case .saturay:
            return "ส."
        }
    }
    
    var nameEN: String {
        switch self {
        case .sunday:
            return "Sunday"
        case .monday:
            return "Monday"
        case .tuesday:
            return "Tuesday"
        case .wednesday:
            return "Wednesday"
        case .thursday:
            return "Thursday"
        case .friday:
            return "Friday"
        case .saturay:
            return "Saturay"
        }
    }
    
    var abbreviationsEN: String {
        switch self {
        case .sunday:
            return "Sun."
        case .monday:
            return "Mon."
        case .tuesday:
            return "Tue."
        case .wednesday:
            return "Wed."
        case .thursday:
            return "Thu."
        case .friday:
            return "Fri."
        case .saturay:
            return "Sat."
        }
    }
    
    var valueStr: String {
        switch self {
        case .sunday:
            return "01"
        case .monday:
            return "02"
        case .tuesday:
            return "03"
        case .wednesday:
            return "04"
        case .thursday:
            return "05"
        case .friday:
            return "06"
        case .saturay:
            return "07"
        }
    }
    
    static var all: [Day] {
        return [.sunday, .monday, .tuesday, .wednesday, .thursday, .friday, .saturay]
    }
}

public enum Month: Int {
    case jan = 1, feb, mar, apr, may, jun, jul, aug, sep, oct, nov, dec
    
    static func initialFrom(_ value: Int?) -> Month? {
        guard let value = value else {
            return nil
        }
        return Month(rawValue: value)
    }
    
    static var current: Month {
        return Month(rawValue: Calendar.current.component(.month, from: Date()))!
    }
    
    var nameTH: String {
        switch self {
        case .jan:
            return "มกราคม"
        case .feb:
            return "กุมภาพันธ์"
        case .mar:
            return "มีนาคม"
        case .apr:
            return "เมษายน"
        case .may:
            return "พฤษภาคม"
        case .jun:
            return "มิถุนายน"
        case .jul:
            return "กรกฎาคม"
        case .aug:
            return "สิงหาคม"
        case .sep:
            return "กันยายน"
        case .oct:
            return "ตุลาคม"
        case .nov:
            return "พฤศจิกายน"
        case .dec:
            return "ธันวาคม"
        }
    }
    
    var abbreviationsTH: String {
        switch self {
        case .jan:
            return "ม.ค."
        case .feb:
            return "ก.พ."
        case .mar:
            return "มี.ค."
        case .apr:
            return "เม.ย."
        case .may:
            return "พ.ค."
        case .jun:
            return "มิ.ย."
        case .jul:
            return "ก.ค."
        case .aug:
            return "ส.ค."
        case .sep:
            return "ก.ย."
        case .oct:
            return "ต.ค."
        case .nov:
            return "พ.ย."
        case .dec:
            return "ธ.ค."
        }
    }
    
    var nameEN: String {
        switch self {
        case .jan:
            return "January"
        case .feb:
            return "February"
        case .mar:
            return "March"
        case .apr:
            return "April"
        case .may:
            return "May"
        case .jun:
            return "June"
        case .jul:
            return "July"
        case .aug:
            return "August"
        case .sep:
            return "September"
        case .oct:
            return "October"
        case .nov:
            return "November"
        case .dec:
            return "December"
        }
    }
    
    var abbreviationsEN: String {
        switch self {
        case .jan:
            return "Jan."
        case .feb:
            return "Feb."
        case .mar:
            return "Mar."
        case .apr:
            return "Apr."
        case .may:
            return "May"
        case .jun:
            return "Jun."
        case .jul:
            return "Jul."
        case .aug:
            return "Aug."
        case .sep:
            return "Sep."
        case .oct:
            return "Oct."
        case .nov:
            return "Nov."
        case .dec:
            return "Dec."
        }
    }
    
    
    
    var valueStr: String {
        switch self {
        case .jan:
            return "01"
        case .feb:
            return "02"
        case .mar:
            return "03"
        case .apr:
            return "04"
        case .may:
            return "05"
        case .jun:
            return "06"
        case .jul:
            return "07"
        case .aug:
            return "08"
        case .sep:
            return "09"
        case .oct:
            return "10"
        case .nov:
            return "11"
        case .dec:
            return "12"
        }
    }
    
    static var all: [Month] {
        return [.jan, .feb, .mar, .apr, .may, .jun, .jul, .aug, .sep, .oct, .nov, .dec]
    }
}
