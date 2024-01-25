//
//  CoustomTableViewCell.swift
//  TestTask
//
//  Created by Maxim Gridenko on 25.01.2024.
//

import Foundation
import UIKit

final class CountryTableViewCell: UITableViewCell {
    private let nameLabel = UILabel()
    private let phoneCodeLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configureWith(country: Country) {
        nameLabel.text = country.title
        phoneCodeLabel.text = country.phoneCode
    }
}
// MARK: - setting view
private extension CountryTableViewCell{
    func setupView(){
        backgroundColor = UIColor.clear
        addSubviews()
        setupNameLabele()
        setupCodeLabele()
        setupLayout()
    }
}

// MARK: - Setting
private extension CountryTableViewCell{
    func addSubviews(){
        contentView.addSubview(nameLabel)
        contentView.addSubview(phoneCodeLabel)
    }
    
    func setupNameLabele(){
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.font = .systemFont(ofSize: 16)
    }
    func setupCodeLabele(){
        phoneCodeLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneCodeLabel.textColor = .white
        phoneCodeLabel.font = .systemFont(ofSize: 14)
    }
}

//MARK: - Layout
private extension CountryTableViewCell{
    func setupLayout(){
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            phoneCodeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            phoneCodeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}




