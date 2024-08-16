//
//  JobsTableViewCell.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 16/08/2024.
//

import UIKit

class JobsTableViewCell: UITableViewCell {
    
    private lazy var mainContainer: UIView = {
       var view = UIView()
        view.backgroundColor = .white
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
    
    private lazy var labelCompanyDescription: UILabel = {
        var view = UILabel()
        view.numberOfLines = 0
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 14.0)
        view.textColor =  ColorPalette.textPrimary.color
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        self.selectionStyle = .none
        self.backgroundColor = .clear
        self.contentView.addSubview(mainContainer)
        mainContainer.addSubview(labelJobTitle)
        mainContainer.addSubview(labelCompanyName)
        mainContainer.addSubview(labelCompanyDescription)
        self.setupConstraints()
        mainContainer.layer.cornerRadius = 6.0
        mainContainer.clipsToBounds = true
    }
    
    private func setupConstraints() {
        mainContainer.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12).isActive = true
        mainContainer.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        mainContainer.trailingAnchor.constraint(equalTo:  self.contentView.trailingAnchor, constant: -16).isActive = true
        mainContainer.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12).isActive = true
        
        labelJobTitle.topAnchor.constraint(equalTo: self.mainContainer.topAnchor, constant: 12).isActive = true
        labelJobTitle.leadingAnchor.constraint(equalTo: self.mainContainer.leadingAnchor, constant: 12).isActive = true
        labelJobTitle.trailingAnchor.constraint(equalTo:  self.mainContainer.trailingAnchor, constant: -12).isActive = true
        
        labelCompanyName.topAnchor.constraint(equalTo: self.labelJobTitle.bottomAnchor, constant: 4).isActive = true
        labelCompanyName.leadingAnchor.constraint(equalTo: self.labelJobTitle.leadingAnchor).isActive = true
        labelCompanyName.trailingAnchor.constraint(equalTo:  self.labelJobTitle.trailingAnchor).isActive = true
        
        labelCompanyDescription.topAnchor.constraint(equalTo: self.labelCompanyName.bottomAnchor, constant: 16).isActive = true
        labelCompanyDescription.leadingAnchor.constraint(equalTo: self.labelJobTitle.leadingAnchor).isActive = true
        labelCompanyDescription.trailingAnchor.constraint(equalTo:  self.labelJobTitle.trailingAnchor).isActive = true
        labelCompanyDescription.bottomAnchor.constraint(equalTo: self.mainContainer.bottomAnchor, constant: -12).isActive = true
        
        
    }
    
    func updateCell(job: Jobs) {
        labelJobTitle.text = job.positionTitle
        labelCompanyName.text = job.company?.name
        labelCompanyDescription.text = job.description
    }

}
