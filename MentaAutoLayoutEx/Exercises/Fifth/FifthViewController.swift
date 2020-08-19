//
//  FifthViewController.swift
//  MentaAutoLayoutEx
//
//  Created by 山田隼也 on 2020/08/17.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

final class FifthViewController: UIViewController {
    
    // MARK: IBOutlet
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    private var dataSource: [Mock.User] = Mock.users
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        configureTableView()
    }
}

// MARK: - Configuration

extension FifthViewController {
    
    private func configureNavigation() {
        navigationItem.title = "Ex5"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = FifthViewControllerCell.rowHeight
        tableView.tableFooterView = UIView()
        tableView.register(FifthViewControllerCell.nib, forCellReuseIdentifier: FifthViewControllerCell.reuseIdentifier)
    }
}

// MARK: - TableView DataSource

extension FifthViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FifthViewControllerCell.reuseIdentifier, for: indexPath) as! FifthViewControllerCell
        let user = dataSource[indexPath.row]
        cell.configureCell(name: user.name, descriptionText: user.descriptionText)
        return cell
    }
}

// MARK: - TableView Delegate

extension FifthViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
