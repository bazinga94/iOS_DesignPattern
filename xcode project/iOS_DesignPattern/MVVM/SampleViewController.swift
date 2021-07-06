//
//  SampleViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/24.
//

import UIKit

class SampleViewController: UIViewController {

	@IBOutlet weak var ianLabel: UILabel!
	@IBOutlet weak var haleyLabel: UILabel!
	@IBOutlet weak var novelynLabel: UILabel!

	private var viewModel: SampleViewModel!

	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = SampleViewModel.init(model: SampleModel.init(text: "Hello"))
		viewModel.sampleModel.bind { [weak self] memoModel in
			self?.ianLabel.text = memoModel.text
		}

		configureText()
	}

	func configureText() {
		viewModel.changeText(with: "Hello Ian~")
	}
}
