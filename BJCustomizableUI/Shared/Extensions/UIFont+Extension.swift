//
//  UIFont+Extension.swift
//  BJCustomizableUI
//
//  Created by Abdullah on 11/02/2024.
//

import Foundation
import UIKit

extension UIFont {
//    static func poppinsExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Poppins-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold) }
    
//    static func poppinsExtraBold(size: CGFloat = 14) -> UIFont { UIFont.systemFont(ofSize: size, weight: .light) }
    
    static func poppinsExtraBold(size: CGFloat = 14) -> UIFont { UIFont(name: "Poppins-ExtraBold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .light) }
}

extension UIFont {
    
    static func registerAllFonts(bundle: Bundle) {
        jbs_registerFont(
            withFilenameString: "Poppins-ExtraBold.ttf",
            bundle: bundle
        )
    }

    static func jbs_registerFont(withFilenameString filenameString: String, bundle: Bundle) {
        print(" filename \(filenameString) bundle \(bundle)")
        guard let fontURL = bundle.url(forResource: "Poppins-ExtraBold", withExtension: "ttf"),
            let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
            let font = CGFont(fontDataProvider) else {
                fatalError("Couldn't create font from filename: Poppins-ExtraBold with extension .ttf")


        }
        
//       guard let pathForResourceString = bundle.path(forResource: filenameString, ofType: nil) else {
//           print("UIFont+:  Failed to register font - path for resource not found.")
//           return
//       }
//
//       guard let fontData = NSData(contentsOfFile: pathForResourceString) else {
//           print("UIFont+:  Failed to register font - font data could not be loaded.")
//           return
//       }
//
//       guard let dataProvider = CGDataProvider(data: fontData) else {
//           print("UIFont+:  Failed to register font - data provider could not be loaded.")
//           return
//       }
//
//       guard let font = CGFont(dataProvider) else {
//           print("UIFont+:  Failed to register font - font could not be loaded.")
//           return
//       }
        
        

       var errorRef: Unmanaged<CFError>? = nil
       if (CTFontManagerRegisterGraphicsFont(font, &errorRef) == false) {
           print("UIFont+:  Failed to register font - register graphics font failed - this font may have already been registered in the main bundle.")
       }
   }

}
