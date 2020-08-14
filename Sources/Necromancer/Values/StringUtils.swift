//
//  File.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation

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
}
