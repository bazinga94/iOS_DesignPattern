//
//  ObserverPatternViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import UIKit

class ObserverPatternViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		let subject = Subject()
		let _ = Ian(subject: subject)
		let _ = Haley(subject: subject)
		let _ = Novelyn(subject: subject)

		subject.number = 1
		subject.number = 2
		subject.number = 3
	}
}
