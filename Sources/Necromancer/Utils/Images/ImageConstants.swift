//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 10/9/2563 BE.
//

import Foundation
import UIKit

public enum JPEGQuality {
    case lowest
    case low
    case medium
    case high
    case highest
    
    public var value: CGFloat {
        switch self {
        case .lowest:
            return 0
        case .low:
            return 0.25
        case .medium:
            return 0.5
        case .high:
            return 0.75
        case .highest:
            return 1
        }
    }
}
