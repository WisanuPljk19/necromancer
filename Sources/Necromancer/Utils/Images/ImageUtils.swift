//
//  ImageUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation
import UIKit

public class ImageUtils {
    
    /**
     
     - Description
     reduce size of image
     
     - Parameters:
        - image: Image original.
        - quality: The desired quality has decreased.
     
     - Returns:
        - UIImage?: Image after reduce.
     
     - Author:
     wisanu.pljk
     */
    public class func reduce(image: UIImage, with quality: CGFloat) -> UIImage? {
        let width = image.size.width * quality
        let height = image.size.height * quality
        
        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        image.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
        let imageReduce = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        guard imageReduce != nil, let dataImage = imageReduce!.jpegData(compressionQuality: quality) else {
            return nil
        }
        return UIImage(data: dataImage)
    }
    
    /**
     
     - Description
     convert base64 to Image
     
     - Parameters:
        - base64String: image base64
     
     - Returns:
        - UIImage?: Image after convert from base64
     
     - Author:
     wisanu.pljk
     */
    public class func toImage(from base64String: String?) -> UIImage? {
        guard  let base64 = base64String else {
            return nil
        }
        
        guard let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    /**
     
     - Description
     convert Image to Base64
     
     - Parameters:
        - image: Image to convert.
     
     - Returns:
        - StringBase64?: base64 after convert from image.
     
     - Author:
     wisanu.pljk
     */
    public class func toBase64(from image: UIImage?) -> String? {
        guard let image = image else {
            return nil
        }
        
        guard let data = image.pngData() else {
            return nil
        }
        
        return data.base64EncodedString(options: .lineLength64Characters)
    }
    
    /**
     
     - Description
     change image with animation
     
     - Parameters:
        - uiImageView: ImageView component
        - duration: Duration of image unit is second
        - options: Animation option
        - imageChange: The image you want to change.
     
     - Author:
     wisanu.pljk
     */
    public class func changeImage(_ uiImageView: UIImageView,
                                  duration: Double = 0.2,
                                  options: UIView.AnimationOptions = .transitionCrossDissolve,
                                  imageChange: UIImage?){
        UIView.transition(with: uiImageView,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: { uiImageView.image = imageChange },
                          completion: nil)
    }
}
