//
//  SixthViewController.swift
//  MentaAutoLayoutEx
//
//  Created by 山田隼也 on 2020/08/19.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

final class SixthViewController: UIViewController {
    
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

extension SixthViewController {
    
    private func configureNavigation() {
        navigationItem.title = "Ex5"
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = SixthViewControllerCell.rowHeight
        tableView.tableFooterView = UIView()
        tableView.register(SixthViewControllerCell.nib, forCellReuseIdentifier: SixthViewControllerCell.reuseIdentifier)
    }
}

// MARK: - TableView DataSource

extension SixthViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SixthViewControllerCell.reuseIdentifier, for: indexPath) as! SixthViewControllerCell
        let user = dataSource[indexPath.row]
        cell.configureCell(name: user.name, descriptionText: user.descriptionText)
        return cell
    }
}

// MARK: - TableView Delegate

extension SixthViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
