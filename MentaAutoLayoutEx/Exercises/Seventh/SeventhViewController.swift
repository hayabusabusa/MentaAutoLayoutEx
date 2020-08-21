//
//  SeventhViewController.swift
//  MentaAutoLayoutEx
//
//  Created by 山田隼也 on 2020/08/21.
//  Copyright © 2020 Shunya Yamada. All rights reserved.
//

import UIKit

final class SeventhViewController: UIViewController {
    
    // MARK: IBOutlet
    
    // MARK: Properties
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: IBAction
    
    @IBAction func onTapSendButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func onTapBackButton(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - View Touche Event

extension SeventhViewController {
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
