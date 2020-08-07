//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 7/8/2563 BE.
//

import Foundation

public enum PatternDateFormatter: String {
    case dmy = "dd/MM/yyyy"
    case timestamp = "yyyy-MM-dd'T'HH:mm:ss"
    case timestampDisplay = "dd/MM/yyyy HH:mm"
    case fullDateTime = "EEE, d MMM yyyy HH:mm:ss Z"
    case time = "HH:mm"
    case timeWithOutSection = "HH:mm:ss"
    case headerMonth = "MMMM yyyy"
    case fullShortDate = "EEEE d MMMM yyyy"
    case shortDate = "d MMMM yyyy"
    case shortMonthYear = "MMM yy"
}
