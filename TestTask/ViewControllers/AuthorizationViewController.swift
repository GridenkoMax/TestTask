//
//  ViewController.swift
//  TestTask
//
//  Created by Maxim Gridenko on 20.01.2024.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    //MARK: - Private property
    private let appleLogoImage = UIImageView()
    private let googleLogoImage = UIImageView()
    
    private let authorizationLabel = CustomLabel(title: "Войдите в приложение")
    private let authorizationMethodLabel = CustomLabel(
        title: "Выберите один из способов авторизации",
        font: .systemFont(ofSize: 15),
        color: .gray
    )
    private let authorizationButton = CustomButton(title: "Войти по номеру телефона", backgroundColor: .blue)
    private let registrationLabel = CustomLabel(
        title: "Еще нет аккаунта?  ",
        font: .systemFont(ofSize: 15),
        color: .gray
    )
    private let registrationButton = CustomButton(title: "Зарегистрируйтесь ")
    private let registrationContainer = UIStackView()
    
    private let separatorLine = UIView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    //MARK: - Actions
    @objc
    private func showPhoneInputViewController(){
        let phoneInputVC = PhoneInputViewController()
        navigationController?.pushViewController(phoneInputVC, animated: true)
    }
}
// MARK: - setting view
private extension AuthorizationViewController{
    func setupView(){
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        separatorLine.backgroundColor = .gray
        backBarButtonSettings()
        setupLogoImage()
        addSubviews()
        addActions()
        setupRegistrationContainer()
        setupLayout()
        
    }
    
}

// MARK: - Setting
private extension AuthorizationViewController{
    func addSubviews(){
        [authorizationLabel, authorizationButton, authorizationMethodLabel,
         registrationContainer, separatorLine, appleLogoImage, googleLogoImage].forEach{subView in
            view.addSubview(subView)
        }
    }
    func backBarButtonSettings(){
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
    }
    
    func addActions(){
        authorizationButton.addTarget(self,
                                      action: #selector(showPhoneInputViewController),
                                      for: .touchUpInside)
    }
    
    func setupRegistrationContainer(){
        registrationContainer.axis = .horizontal
        registrationContainer.addArrangedSubview(registrationLabel)
        registrationContainer.addArrangedSubview(registrationButton)
    }
    func setupLogoImage(){ // изменить на контейнер?
        appleLogoImage.image = UIImage(named: "apple1")
        appleLogoImage.contentMode = .scaleAspectFit
        appleLogoImage.layer.cornerRadius = 20
        appleLogoImage.clipsToBounds = true
        
        googleLogoImage.image = UIImage(named: "google")
        googleLogoImage.contentMode = .scaleAspectFit
        googleLogoImage.layer.cornerRadius = 20
        googleLogoImage.clipsToBounds = true
    }
    
    
}

//MARK: - Layout
private extension AuthorizationViewController{
    func setupLayout(){
        [authorizationLabel,
         appleLogoImage,
         googleLogoImage,
         authorizationButton,
         authorizationMethodLabel,
         registrationContainer,
         separatorLine ].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        NSLayoutConstraint.activate([
            
            
            authorizationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100 ),
            authorizationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            authorizationMethodLabel.topAnchor.constraint(equalTo: authorizationLabel.bottomAnchor, constant: 15),
            authorizationMethodLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            appleLogoImage.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -15),
            appleLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            appleLogoImage.widthAnchor.constraint(equalToConstant: 70),
            appleLogoImage.heightAnchor.constraint(equalToConstant: 70),
            
            googleLogoImage.bottomAnchor.constraint(equalTo: separatorLine.topAnchor, constant: -15),
            googleLogoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            googleLogoImage.widthAnchor.constraint(equalToConstant: 70),
            googleLogoImage.heightAnchor.constraint(equalToConstant: 70),
            
            separatorLine.bottomAnchor.constraint(equalTo: authorizationButton.topAnchor, constant: -25),
            separatorLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            separatorLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            separatorLine.heightAnchor.constraint(equalToConstant: 1),
            
            authorizationButton.topAnchor.constraint(equalTo: authorizationLabel.bottomAnchor, constant: 350),
            authorizationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            authorizationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            authorizationButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            registrationContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            registrationContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
        ])
    }
    
}
