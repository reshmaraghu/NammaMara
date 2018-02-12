//
//  HomeContentVC.swift
//  NammaMara
//
//  Created by Raghu, Reshma L on 2/11/18.
//  Copyright © 2018 Raghu, Reshma L. All rights reserved.
//

import UIKit

class HomeContentVC: UIViewController {

	@IBOutlet var treeImageView: UIImageView!
	@IBOutlet var treeTitleView: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()
		self.treeImageView.image = UIImage(named: "Images/BombaxScopulorus.JPG")
		self.treeTitleView.text = "Bombax Scopulorus"
	}
}
