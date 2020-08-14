//
//  ValueUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation

public class ObjectUtils {
    
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
}
