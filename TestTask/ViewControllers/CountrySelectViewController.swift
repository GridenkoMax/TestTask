//
//  CountrySelectViewController.swift
//  TestTask
//
//  Created by Maxim Gridenko on 20.01.2024.
//

import Foundation
import UIKit

final class CountrySelectViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    //MARK: - Private property
    private var countries = [Country]()
    private var tableView: UITableView!
    
    private let countryLabel = CustomLabel(title: "Выберите страну")
    private let countrySearch = CustomTextField(placeholder: "Search")
    
    private let countryContainer = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
    }
    
    
    //MARK: - Table View methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        let country = countries[indexPath.row]
        cell.textLabel?.text = country.title
        return cell
    }
}




// MARK: - setting view
private extension CountrySelectViewController{
    func setupView(){
        view.backgroundColor = #colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)
        setupCountryContainer()
        setupTableView()
        loadCountries()
        addSubviews()
        setupLayout()
    }
}



// MARK: - Setting
private extension CountrySelectViewController{
    func addSubviews(){
        view.addSubview(countryContainer)
    }
    func setupCountryContainer(){
        countryContainer.axis = .vertical
        countryContainer.spacing = 15
        countryContainer.addArrangedSubview(countryLabel)
        countryContainer.addArrangedSubview(countrySearch)
    }

    func setupTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.backgroundColor = UIColor.clear
        view.addSubview(tableView)
    }
    private func loadCountries() {
        Task {
            do {
                self.countries = try await NetworkService.shared.getCountries()
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
}

//MARK: - Layout
private extension CountrySelectViewController{
    func setupLayout(){
        [countryContainer, tableView].forEach{$0.translatesAutoresizingMaskIntoConstraints = false}
        NSLayoutConstraint.activate([
            
            countryContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            countryContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            countryContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            countrySearch.heightAnchor.constraint(equalToConstant: 50),
            
            
            tableView.topAnchor.constraint(equalTo: countryContainer.bottomAnchor, constant: 16),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}
