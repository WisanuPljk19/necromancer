//
//  ValueUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation

public class ValueUtils {
    
    /**
     
     - Description
     Check any object  is `Nil` must return `true`

     - Parameters:
        - any: Any object
     
     - Returns:
        - Bool?: return any object is `Nil`
     
     - Author:
     wisanu.pljk
     */
    public class func isNil(any: Any?) -> Bool{
        return any == nil
    }
    
    /**
     
     - Description
     Check any object  is `NotNil` must return `true`

     - Parameters:
        - any: Any object
     
     - Returns:
        - Bool?: return any object is `NotNil`
     
     - Author:
     wisanu.pljk
     */
    public class func isNotNil(any: Any?) -> Bool{
        return any != nil
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
}
