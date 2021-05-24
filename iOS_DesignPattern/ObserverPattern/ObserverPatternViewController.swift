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

	private var subject: Subject = Subject.init()

	override func viewDidLoad() {
		super.viewDidLoad()

		let _ = Ian(subject: subject, delegate: self)
		let _ = Haley(subject: subject)
		let _ = Novelyn(subject: subject)

		configureText()
	}

	func configureText() {
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
