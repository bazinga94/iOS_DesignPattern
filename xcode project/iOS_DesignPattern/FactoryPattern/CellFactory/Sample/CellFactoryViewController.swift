//
//  CellFactoryViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/08/18.
//

import UIKit

class CellFactoryViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(UINib(nibName: "FirstSampleTableViewCell", bundle: nil), forCellWithReuseIdentifier: "FirstSampleTableViewCell")
		tableView.register(UINib(nibName: "SecondSampleTableViewCell", bundle: nil), forCellWithReuseIdentifier: "SecondSampleTableViewCell")
	}
}

extension CellFactoryViewController: UITableViewDelegate {

}

extension CellFactoryViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return
	}
}
