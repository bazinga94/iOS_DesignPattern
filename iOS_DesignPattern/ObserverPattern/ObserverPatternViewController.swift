//
//  ObserverPatternViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import UIKit

class ObserverPatternViewController: UIViewController {

	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var ianLabel: UILabel!
	@IBOutlet weak var haleyLabel: UILabel!
	@IBOutlet weak var novelynLabel: UILabel!

	override func viewDidLoad() {
		super.viewDidLoad()

		let subject = Subject()
		let _ = Ian(subject: subject, delegate: self)
		let _ = Haley(subject: subject)
		let _ = Novelyn(subject: subject)

		subject.text = "Hello Ian~"
//		subject.text = "Hello Haley~"
//		subject.text = "Hello Novelyn~"
	}
}

extension ObserverPatternViewController: IanDelegate {
	func changeLabel(text: String) {
		ianLabel.text = text
	}
}

protocol IanDelegate: AnyObject {
	func changeLabel(text: String)
}
