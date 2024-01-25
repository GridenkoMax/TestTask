//
//  CustomButton.swift
//  TestTask
//
//  Created by Maxim Gridenko on 21.01.2024.
//

import Foundation
import UIKit

final class CustomButton: UIButton {
    init(
        title: String,
        font: UIFont = .systemFont(ofSize: 15),
        backgroundColor: UIColor? = nil,
        titleColor: UIColor = .white,
        isEnabled: Bool = true
    ){
        super.init(frame: .zero)
        
        setupSelfButton(title: title,
                        font: font,
                        backgroundColor: backgroundColor,
                        titleColor:  titleColor,
                        isEnabled: isEnabled
                        
        )
        
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupSelfButton(title: String,
                                 font: UIFont,
                                 backgroundColor: UIColor?,
                                 titleColor: UIColor = .white,
                                 isEnabled: Bool
    ){
        
        setTitle(title, for: .normal)
        setTitleColor(titleColor, for: .normal)
        titleLabel?.font = font
        layer.cornerRadius = 20
        self.backgroundColor = backgroundColor ?? .clear
        self.isEnabled = isEnabled
    }
}
