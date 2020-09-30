//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 30/9/2563 BE.
//

import Foundation

open class Necromancer {
    
    public static var locale = Locale.current
    public static var timeZone = TimeZone.current
    public static var identifier = Calendar.Identifier.gregorian
    
    public class func configure(timeZone: TimeZone? = nil,
                         locale: Locale? = nil,
                         identifier: Calendar.Identifier? = nil) {
        if let locale = locale {
            Necromancer.locale = locale
        }else {
            Log.debug("use default Locale")
        }
        
        if let timeZone = timeZone {
            Necromancer.timeZone = timeZone
        }else {
            Log.debug("use default TimeZone")
        }
        
        if let identifier = identifier {
            Necromancer.identifier = identifier
        }else {
            Log.debug("use default Identifier")
        }
    }
    
    public typealias Apps = AppUtils
    public typealias Calendars = CalendarUtils
    public typealias DateTimes = DateTimeUtils
    public typealias Images = ImageUtils
    public typealias Objects = ObjectUtils
    public typealias Strings = StringUtils
}
