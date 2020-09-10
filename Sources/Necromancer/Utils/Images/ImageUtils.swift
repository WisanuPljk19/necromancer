//
//  ImageUtils.swift
//  
//
//  Created by Wisanu Paunglumjeak on 14/8/2563 BE.
//

import Foundation
import UIKit

public class ImageUtils {
    
    public class func reduce(image: UIImage, with quality: CGFloat) -> Data? {
        return image.jpegData(compressionQuality: quality)
    }
    
    public class func toImage(from base64String: String?) -> UIImage? {
        guard  let base64 = base64String else {
            return nil
        }
        
        guard let data = Data(base64Encoded: base64, options: .ignoreUnknownCharacters) else {
            return nil
        }
        
        return UIImage(data: data)
    }
    
    public class func toBase64(from image: UIImage?) -> String? {
        guard let image = image else {
            return nil
        }
        
        guard let data = image.pngData() else {
            return nil
        }
        
        return data.base64EncodedString(options: .lineLength64Characters)
    }
    
    public class func changeImageWithAnimation(_ uiImageView: UIImageView,
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
