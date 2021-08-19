//
//  CellFactoryViewController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/08/18.
//

import UIKit

enum CellType {
	case first
	case second
}

struct CellFactoryModel {
	let type: CellType
	let first: FirstCellItem
	let second: SecondCellItem
}

class CellFactoryViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	fileprivate let cellFactory: CellControllerFactory = CellControllerFactory()
	private let model: CellFactoryModel = CellFactoryModel(type: .second, first: FirstCellItem(firstLabel: "first label~"), second: SecondCellItem(secondLabel: "second label~"))

	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.delegate = self
		tableView.dataSource = self
		cellFactory.registerCells(on: tableView)
	}
}

extension CellFactoryViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		cellFactory.cellController(with: model).didSelectCell(itemAt: indexPath)
	}
}

extension CellFactoryViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return cellFactory.cellController(with: model).cellFromReusableCellHolder(tableView, forIndexPath: indexPath)
	}
}

fileprivate class CellControllerFactory {
	func registerCells(on tableView: UITableView) {
		FirstSampleTableViewCellController.registerCell(on: tableView)
		SecondSampleTableViewCellController.registerCell(on: tableView)
	}

	func cellController(with items: CellFactoryModel) -> CellController<UITableView> {

		switch items.type {
			case .first:
				return FirstSampleTableViewCellController(item: items.first)
			case .second:
				return SecondSampleTableViewCellController(item: items.second)
		}
	}
}
