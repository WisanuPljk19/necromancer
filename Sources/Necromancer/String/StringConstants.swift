//
//  StringConstants.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation

public enum RegEx: String {
    case email
    case mobile
    case decimal
    case number
    case none
    
    var expression: String {
        switch self {
        case .email:
            return "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        case .mobile:
            return "[\\d]{10}"
        case .decimal:
            return "[\\d]+(\\.?)[\\d]+"
        case .number:
            return "[\\d]+"
        case .none:
            return ""
        }
    }
}
