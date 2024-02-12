//
//  BJCustomizableUI.swift
//  BJCustomizableUI
//
//  Created by Abdullah on 11/02/2024.
//

import UIKit

public final class BJCustomizableUI {
    public init() {
        
        UIFont.registerAllFonts(bundle: Bundle.module)
//        UIFont.registerAllFonts(bundle: Bundle(for: BJCustomizableUI.self))
//        UIFont.registerAllFonts(bundle: Bundle(identifier: "com.myapp.BJCustomizableUI")!)
    }
}
