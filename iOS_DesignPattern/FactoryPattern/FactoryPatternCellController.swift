//
//  FactoryPatternCellController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/06/02.
//

import UIKit

protocol CollectionViewCellController {
	static func registerCell(on collectionView: UICollectionView)
	func cellFromCollectionView(_ collectionView: UICollectionView, itemAt indexPath: IndexPath) -> UICollectionViewCell
	func didSelectCell(itemAt indexPath: IndexPath)
}

protocol CollectionViewCellControllerFactory {
	func registerCells(on collectionView: UICollectionView)
}

class SampleCollectionViewCellControllerFactory: CollectionViewCellControllerFactory {
	func registerCells(on collectionView: UICollectionView) {
		SampleCollectionViewCellController.registerCell(on: collectionView)
	}

	func cellController(with item: ItemModelProtocol) -> [CollectionViewCellController] {	// section이 있는 경우 [[]] return
		return [SampleCollectionViewCellController(item: item)]
	}
}

protocol ItemModelProtocol {
}

class SampleCollectionViewCellController: CollectionViewCellController {

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

// 새로운 cell을 추가하려고 할 때 view controller의 수정이 필요 없다.
