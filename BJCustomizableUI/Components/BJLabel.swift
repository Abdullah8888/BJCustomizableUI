//
//  BJLabel.swift
//  BJCustomizableUI
//
//  Created by Abdullah on 11/02/2024.
//

import Foundation
import UIKit

public class BJLabel: UILabel {

    private var insets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 0)
    
    public override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }

    public override var intrinsicContentSize: CGSize {
        let originalSize = super.intrinsicContentSize
        return CGSize(width: originalSize.width + insets.left + insets.right, height: originalSize.height + insets.top + insets.bottom)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = .poppinsExtraBold(size: 13)
    }
    
    init(padding: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0), alignment: NSTextAlignment = .center) {
        super.init(frame: .zero)
        self.numberOfLines = 0
        self.textAlignment = alignment
        self.insets = padding
        self.lineBreakMode = .byWordWrapping
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
