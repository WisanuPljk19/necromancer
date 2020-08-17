//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation
import UIKit

public class StringUtils {
    
    /**
     
     - Description
     Check string is `Nil` or `Empty("")` must return `true`

     - Parameters:
        - string: string input
     
     - Returns:
        - Bool?: return string  string is `Nil` or `Empty("")`
     
     - Author:
     wisanu.pljk
     */
    public class func isNilOrEmpty(from string: String?) -> Bool {
        return string == nil || string == ""
    }
    
    /**
     
     - Description
     Check string is `NotNil` or `NotEmpty("")` must return `true`

     - Parameters:
        - string: string input
     
     - Returns:
        - Bool?: return string is `NotNil` or `NotEmpty("")`
     
     - Author:
     wisanu.pljk
     */
    public class func isNotNilOrEmpty(from string: String?) -> Bool {
        return string != nil && string != ""
    }
    
    /**
    
    - Description
    Set value string to object if value is `Empty("")` must return `Nil`

    - Parameters:
       - string: string input
    
    - Returns:
       - String?: if value is `Empty("")` must return `Nil` else return value
    
    - Author:
    wisanu.pljk
    */
    public class func setValue(from string: String?) -> String? {
        return string == "" ? nil : string
    }
    
    /**
    
    - Description
    Get value string for display if value is `Nil` must return `Empty("")`

    - Parameters:
       - string: string input
    
    - Returns:
       - String: if value is `Nil` must return `Empty("")`
    
    - Author:
    wisanu.pljk
    */
    public class func getValue(from string: String?) -> String {
        return string ?? ""
    }
    
    /**
    
    - Description
    Parse `String` to `Int` if `String` is `Nil` or valid pattern must return `Nil`

    - Parameters:
       - string: string value input
    
    - Returns:
       - Int?: return `Int` value  if `String` is `Nil` or valid pattern must return `Nil`
    
    - Author:
    wisanu.pljk
    */
    public class func toInt(from string: String?)-> Int?{
        guard let string = string else {
            return nil
        }
        return Int(string)
    }
    
    /**
    
    - Description
    Parse `String` to `Double` if `String` is `Nil` or valid pattern must return `Nil`

    - Parameters:
       - string: string value input
    
    - Returns:
       - Double?: return `Double` value  if `String` is `Nil` or valid pattern must return `Nil`
    
    - Author:
    wisanu.pljk
    */
    public class func toDouble(from string: String?) -> Double?{
        guard let string = string else {
            return nil
        }
        return Double(string)
    }
    
    /**
    
    - Description
    Check `String` with regular expression

    - Parameters:
       - string: string value input
       - regEx: `RegEx` pattern for check
    
    - Returns:
       - Bool: return `true` when value is regular expression
    
    - Author:
    wisanu.pljk
    */
    public class func checkRegEx(from value: String?, with regEx: RegEx) -> Bool {
        guard let value = value else {
            return false
        }
        
        guard regEx != .none else {
            return true
        }
        
        let predicate = NSPredicate(format: "SELF MATCHES %@", regEx.expression)
        return predicate.evaluate(with: value)
    }
    
    /**
    
    - Description
    Validate value of `UITextField` with `UIKeyboardType`, `limit`, `isRequire`

    - Parameters:
       - value: value of `UITextField`
       - keyboardType: `UIKeyboardType` of `UITextField` ex. emailAddress, decimal
       - limit: maximum of value
       - isRequire: if this `UITextField` must `NotNil` or `Empty` input is true
    
    - Returns:
       - Bool: return `true` value is valid
    
    - Author:
    wisanu.pljk
    */
    public class func validateTextField(from value: String?, with keyboardType: UIKeyboardType,
                                        limit: Int, isRequire: Bool) -> Bool{

        guard isNotNilOrEmpty(from: value) else {
            return !isRequire
        }
        
        guard value!.count <= limit else {
            return false
        }
        
        guard keyboardType != .default else {
            return true
        }
        
        var regEx: RegEx {
            switch keyboardType {
            case .numberPad:
                return .number
            case .decimalPad:
                return .decimal
            case .emailAddress:
                return .email
            case .phonePad:
                return .mobile
            default:
                return .none
            }
        }
        return checkRegEx(from: value, with: regEx)
    }
}
