//
//  ViewController.swift
//  Netology_IB_Instruments
//
//  Created by MacBook Air on 18.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private var profileCustomView: ProfileView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        profileCustomView = Bundle.main.loadNibNamed("ProfileView", owner: nil)?.first as? ProfileView
        view.addSubview(profileCustomView)
    }
}

