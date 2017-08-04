//
//  WeatherDecorationView.swift
//
//  Created by Guihal Gwenn on 04/08/2017.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import CoreGraphics

class WeatherDecorationViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var backgroundColor: UIColor?
    var borderColor: UIColor?
    var cornerRadius: CGFloat?
    
    override func copy(with zone: NSZone?) -> Any {
        let copy = super.copy(with: zone) as! WeatherDecorationViewLayoutAttributes
        copy.backgroundColor = backgroundColor
        copy.borderColor = borderColor
        copy.cornerRadius = cornerRadius
        return copy
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? WeatherDecorationViewLayoutAttributes else {
            return false
        }
        if object.backgroundColor != backgroundColor && object.borderColor != borderColor && object.cornerRadius != cornerRadius {
            return false
        }
        return super.isEqual(object)
    }
    
}

class WeatherDecorationView: UICollectionReusableView {
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        
        guard let layoutAttributes = layoutAttributes as? WeatherDecorationViewLayoutAttributes else {
            fatalError("WeatherDecorationViewLayoutAttributes required")
        }
        
        backgroundColor = layoutAttributes.backgroundColor
        if let borderColor = layoutAttributes.borderColor {
            layer.borderColor = borderColor.cgColor
            layer.borderWidth = 1
        } else {
            layer.borderWidth = 0
        }

        layer.cornerRadius = layoutAttributes.cornerRadius ?? 0
    }
}
