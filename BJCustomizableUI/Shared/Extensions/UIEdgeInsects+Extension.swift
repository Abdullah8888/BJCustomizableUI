//
//  UIEdgeInsects+Extension.swift
//  BJCustomizableUI
//
//  Created by Abdullah on 11/02/2024.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    
    public init(allEdges: CGFloat) {
        self.init(top: allEdges, left: allEdges, bottom: allEdges, right: allEdges)
    }
    
    public static func topOnly(_ topInset: CGFloat) -> Self {
        .init(top: topInset, left: 0, bottom: 0, right: 0)
    }
    
    public static func bottomOnly(_ bottomInset: CGFloat) -> Self {
        .init(top: 0, left: 0, bottom: bottomInset, right: 0)
    }
    
    public static func leftOnly(_ leftInsect: CGFloat) -> Self {
        .init(top: 0, left: leftInsect, bottom: 0, right: 0)
    }
    
    public static func rightOnly(_ rightInsect: CGFloat) -> Self {
        .init(top: 0, left: 0, bottom: 0, right: rightInsect)
    }
    
    public static func topLeftOnly(_ topInsect: CGFloat, _ leftInsect: CGFloat) -> Self {
        .init(top: topInsect, left: leftInsect, bottom: 0, right: 0)
    }
    
    public static func topBottomOnly(_ topInsect: CGFloat, _ bottomInsect: CGFloat) -> Self {
        .init(top: topInsect, left: 0, bottom: bottomInsect, right: 0)
    }
    
    public static func sides(_ leftInect: CGFloat, _ rightInsect: CGFloat) -> Self {
        .init(top: 0, left: leftInect, bottom: 0, right: rightInsect)
    }
}
