//
//  BottonUtils.swift
//  
//
//  Created by wisanu-p on 30/7/2564 BE.
//

import Foundation
import UIKit

public class ButtonUtils {
    
    /**
     
     - Description
     change state button with animation
     
     - Parameters:
        - button: Button component
        - duration: Duration of image unit is second
        - options: Animation option
        - stateChange: The state  you want to change.
     
     - Author:
     wisanu.pljk
     */
    public class func changeState(_ button: UIButton,
                                  duration: Double = 0.2,
                                  options: UIView.AnimationOptions = .transitionCrossDissolve,
                                  stateChange: UIControl.State){
        UIView.transition(with: button,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {
                            switch stateChange {
                            case .normal:
                                button.isEnabled = true
                            case .disabled:
                                button.isEnabled = false
                            case .highlighted:
                                button.isHighlighted = true
                            case .selected:
                                button.isSelected = true
                            default:
                                break
                            }
                          }, completion: nil)
    }
    
    /**
     
     - Description
     change image button with animation
     
     - Parameters:
     - button: Button component
        - duration: Duration of image unit is second
        - options: Animation option
        - imageChange: The image you want to change.
     
     - Author:
     wisanu.pljk
     */
    public class func changeImage(_ button: UIButton,
                                  duration: Double = 0.2,
                                  options: UIView.AnimationOptions = .transitionCrossDissolve,
                                  imageChange: UIImage?){
        UIView.transition(with: button,
                          duration: duration,
                          options: .transitionCrossDissolve,
                          animations: {
                            button.setImage(imageChange, for: .normal)
                          },
                          completion: nil)
    }
}
