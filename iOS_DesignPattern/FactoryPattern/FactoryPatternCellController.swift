//
//  FactoryPatternCellController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/06/02.
//

import UIKit

protocol CellectionViewSectionController {

}

protocol CollectionViewCellController {
	static func registerCell(on collectionView: UICollectionView)
	func cellFromCollectionView(_ collectionView: UICollectionView, itemAt indexPath: IndexPath) -> UICollectionViewCell
	func didSelectCell(itemAt indexPath: IndexPath)
}

class CollectionViewCellControllerFactory {
	func registerCells(on collectionView: UICollectionView) {
	}

	func cellController(with item: ItemModelProtocol) -> [CollectionViewCellController] {
		return []
	}
}

protocol ItemModelProtocol {
}

class YGTransferMemoCollectionViewCellController: CollectionViewCellController {

	private let item: ItemModelProtocol

	init(item: ItemModelProtocol) {
		self.item = item
	}

	static func registerCell(on collectionView: UICollectionView) {
	}

	func cellFromCollectionView(_ collectionView: UICollectionView, itemAt indexPath: IndexPath) -> UICollectionViewCell {
	return UICollectionViewCell()
	}

	func didSelectCell(itemAt indexPath: IndexPath) {
	}
}
