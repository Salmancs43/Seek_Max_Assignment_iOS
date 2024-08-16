//
//  JobsViewController.swift
//  Seek_Task
//
//  Created by Muhammad Salman on 15/08/2024.
//

import UIKit

import UIKit

class JobsViewController: UIViewController, UITableViewDataSource {
    private let viewModel: JobsViewModel
    private let tableView = UITableView()

    init(viewModel: JobsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        self.tabBarController?.navigationItem.hidesBackButton = true
        self.bind()
        self.setupTableView()
        self.setupConstraints()
        self.fetchJobListing()
    }
    
    private func setupTableView() {
        tableView.backgroundColor =  ColorPalette.backgroundSecondard.color
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(JobsTableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func fetchJobListing() {
        Task {
            await self.viewModel.fetchJobs()
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel.jobsReponseModel?.jobs?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? JobsTableViewCell
        if let jobObject = self.viewModel.jobsReponseModel?.jobs?[indexPath.row] {
            cell?.updateCell(job:  jobObject)
        }
        return cell ?? UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let jobDetail = self.viewModel.jobsReponseModel?.jobs?[indexPath.row] {
            self.viewModel.cordinator.goToJobDetail(jobDetail: jobDetail)
        }
    }
    
    private func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension JobsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension JobsViewController {
    func bind() {
        viewModel.state.addObserver { [weak self] status in
            switch status {
            case .idle: break
            case .errorFetchingJobs:
                self?.alert(message: "Something Went Wrong")
            case .successFetchingJobs:
                self?.reloadTableView()
            }
        }
    }
}
