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
    
    /**
     
     - Description
     Decode `Json Data` to Class that implement `Decodable`

     - Parameters:
        - decodingType: type of class that implement `Decodable`
        - data: Json data
     
     - Returns:
        - `<T: Decodable>?`: return object that implement `Decodable`
     
     - Author:
     wisanu.pljk
     */
    public class func decode<T: Decodable>(from decodingType: T.Type, data: Data?) -> T? {
        guard let dataGeneric = data else {
            return nil
        }
        var object: T?
        do {
            object = try JSONDecoder().decode(decodingType, from: dataGeneric)
        } catch {
            print(error.localizedDescription)
        }
        return object
    }
    
    /**
    
    - Description
    Encode object that implement `Decodable` to `Dictionary`

    - Parameters:
       - object: object that implement `Decodable`
    
    - Returns:
       - `[String: Any]?`: return `Dictionary`
    
    - Author:
    wisanu.pljk
    */
    public class func encode(from object: Encodable) -> [String: Any]? {
        return (try? JSONSerialization.jsonObject(with: object.getData(),
                                                  options: [])).flatMap{$0 as? [String: Any]}
    }
}

extension Encodable{
    internal func getData() throws -> Data{
        return try JSONEncoder().encode(self)
    }
}
