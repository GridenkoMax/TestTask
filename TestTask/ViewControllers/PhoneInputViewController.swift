//
//  PhoneInputViewController.swift
//  TestTask
//
//  Created by Maxim Gridenko on 20.01.2024.
//

import Foundation
import UIKit


final class PhoneInputViewController: UIViewController{
    
    //MARK: - Private property
    private let enterNumber = CustomLabel(title: "Введите ваш номер телефона")
    private let yourNumberIsActive = CustomLabel(
        title: "Мы должны убедиться, что ваш номер телефона активен ",
        font: .systemFont(ofSize: 15),
        color: .gray)
    private let phoneNumber = CustomTextField(placeholder: "Номер телефона")
    private let nextButton = CustomButton(title:"Next", backgroundColor: .gray, isEnabled: false)
    
    private let dataEncryption = CustomLabel(
        title: "Ваши данные будут надежно защищены и не будут публичными, если вы не захотите сделать их таковыми вручную в настройках приватности",
        font: .systemFont(ofSize: 12),
        color: .gray)
    
    
    private let numberContainer = UIStackView()
    private var dataEncryptionContainer = UIStackView()
    private var lockImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    //MARK: - Actions
    
    @objc
    private func showCountrySelectViewController(){
        let countrySelectVC = CountrySelectViewController()
        present(countrySelectVC, animated: true)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// MARK: - setting view
private extension PhoneInputViewController{
    func setupView(){
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        addActions()
        addSubviews()
        setupLayout()
        setupLockImage()
        setupDataEncryptionContainer()
        setupNumberContainer()
        setupGestureToHideKeyboard()
        phoneNumber.addTarget(self, action: #selector(phoneNumberChanged), for: .editingChanged)
    }
}

// MARK: - Setting
private extension PhoneInputViewController{
    func addSubviews(){
        view.addSubview(enterNumber)
        view.addSubview(yourNumberIsActive)
        view.addSubview(phoneNumber)
        view.addSubview(nextButton)
        view.addSubview(numberContainer)
        view.addSubview(lockImageView)
        view.addSubview(dataEncryption)
        view.addSubview(dataEncryptionContainer)
    }
    func setupNumberContainer(){
        numberContainer.axis = .vertical
        numberContainer.spacing = 15
        numberContainer.addArrangedSubview(enterNumber)
        numberContainer.addArrangedSubview(phoneNumber)
        numberContainer.addArrangedSubview(yourNumberIsActive)
        
    }
    func setupDataEncryptionContainer(){
        dataEncryptionContainer.axis = .horizontal
        dataEncryptionContainer.spacing = 15
        dataEncryptionContainer.addArrangedSubview(lockImageView)
        dataEncryptionContainer.addArrangedSubview(dataEncryption)

    }
    
    func addActions(){
        nextButton.addTarget(self,
                             action: #selector(showCountrySelectViewController),
                             for: .touchUpInside)
    }
    func setupGestureToHideKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    @objc func phoneNumberChanged(_ textField: UITextField) {
        if let number = textField.text, Validate.isValidPhoneNumber(number) {
            nextButton.isEnabled = true
            nextButton.backgroundColor = .blue
        } else {
            nextButton.isEnabled = false
            nextButton.backgroundColor = .gray
        }
    }
    func setupLockImage(){
        lockImageView = UIImageView(image: UIImage(systemName: "lock"))
        lockImageView.contentMode = .scaleAspectFit
        lockImageView.tintColor = .gray
        
    }
}


//MARK: - Layout
private extension PhoneInputViewController{
    func setupLayout(){
        [enterNumber,
         yourNumberIsActive,
         phoneNumber,
         nextButton,
         numberContainer,
         lockImageView,
         dataEncryptionContainer].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        NSLayoutConstraint.activate([
            
            numberContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            numberContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            numberContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            
            phoneNumber.heightAnchor.constraint(equalToConstant: 50),
            
            dataEncryption.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -16),
            
            dataEncryption.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            dataEncryption.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
            nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
            
        ])
    }
}
