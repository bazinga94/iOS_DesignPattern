//
//  ViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
	}

	@IBAction func goObserverPattern(_ sender: Any) {
		let viewController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "ObserverPatternViewController")
		self.navigationController?.pushViewController(viewController, animated: true)
	}
}

