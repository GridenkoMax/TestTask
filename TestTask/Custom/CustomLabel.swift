//
//  CustomLabel.swift
//  TestTask
//
//  Created by Maxim Gridenko on 21.01.2024.
//

import Foundation
import UIKit

final class CustomLabel: UILabel {
    
    init(title: String, font: UIFont = .boldSystemFont(ofSize: 28), color: UIColor = .white){
        super.init(frame: .zero)
        
        setupSelfLabel(title: title, font: font, color: color)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfLabel(title: String, font: UIFont, color: UIColor ){
        text = title
        self.font = font
        textColor = color
        numberOfLines = 0
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
    }
}
