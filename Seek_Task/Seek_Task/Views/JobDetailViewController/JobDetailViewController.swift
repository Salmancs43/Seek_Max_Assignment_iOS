//
//  JobDetailViewController.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import UIKit

class JobDetailViewController: UIViewController {
    private let viewModel: JobDetailViewModel
    
    private lazy var mainContainer: UIView = {
       var view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelJobTitle: UILabel = {
       var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.font = .boldSystemFont(ofSize: 16.0)
        view.textColor = ColorPalette.textPrimary.color
        return view
    }()
    
    private lazy var labelCompanyName: UILabel = {
       var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.font = UIFont.systemFont(ofSize: 12.0)
        view.textColor =  ColorPalette.textSecondary.color
        return view
    }()
    
    private lazy var labelSalaryRange: UILabel = {
       var view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.font = .boldSystemFont(ofSize: 16.0)
        view.textColor = ColorPalette.textPrimary.color
        return view
    }()
    
    private lazy var labelCompanyDescription: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor =  ColorPalette.textPrimary.color
        return view
    }()
    
    init(viewModel: JobDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorPalette.backgroundSecondard.color
        self.setupView()
        // Do any additional setup after loading the view.
    }
    
    private func setupView() {
        self.view.addSubview(mainContainer)
        mainContainer.addSubview(labelJobTitle)
        mainContainer.addSubview(labelCompanyName)
        mainContainer.addSubview(labelSalaryRange)
        mainContainer.addSubview(labelCompanyDescription)
        self.setupConstraints()
        self.setupDetails()
    }
    
    private func setupConstraints() {
        mainContainer.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 12).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        mainContainer.trailingAnchor.constraint(equalTo:  self.view.trailingAnchor).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -12).isActive = true
        
        labelJobTitle.topAnchor.constraint(equalTo: self.mainContainer.topAnchor, constant: 12).isActive = true
        labelJobTitle.leadingAnchor.constraint(equalTo: self.mainContainer.leadingAnchor, constant: 24).isActive = true
        labelJobTitle.trailingAnchor.constraint(equalTo:  self.mainContainer.trailingAnchor, constant: -24).isActive = true
        
        labelCompanyName.topAnchor.constraint(equalTo: self.labelJobTitle.bottomAnchor, constant: 4).isActive = true
        labelCompanyName.leadingAnchor.constraint(equalTo: self.labelJobTitle.leadingAnchor).isActive = true
        labelCompanyName.trailingAnchor.constraint(equalTo:  self.labelJobTitle.trailingAnchor).isActive = true
        
        labelSalaryRange.topAnchor.constraint(equalTo: self.labelCompanyName.bottomAnchor, constant: 16).isActive = true
        labelSalaryRange.leadingAnchor.constraint(equalTo: self.labelJobTitle.leadingAnchor).isActive = true
        labelSalaryRange.trailingAnchor.constraint(equalTo:  self.labelJobTitle.trailingAnchor).isActive = true
        
        labelCompanyDescription.topAnchor.constraint(equalTo: self.labelSalaryRange.bottomAnchor, constant: 16).isActive = true
        labelCompanyDescription.leadingAnchor.constraint(equalTo: self.labelJobTitle.leadingAnchor).isActive = true
        labelCompanyDescription.trailingAnchor.constraint(equalTo:  self.labelJobTitle.trailingAnchor).isActive = true
        labelCompanyDescription.bottomAnchor.constraint(lessThanOrEqualTo: self.mainContainer.bottomAnchor, constant: -12).isActive = true
        
        
    }
    
    private func setupDetails() {
        labelJobTitle.text = self.viewModel.jobDetail.positionTitle
        labelCompanyName.text = self.viewModel.jobDetail.company?.name
        if let minSalary = self.viewModel.jobDetail.salaryRange?.min, let maxSalary = self.viewModel.jobDetail.salaryRange?.max {
            labelSalaryRange.text = "Salary Range: \(minSalary) to \(maxSalary)"
        }
      
        labelCompanyDescription.text = self.viewModel.jobDetail.description
    }
}
