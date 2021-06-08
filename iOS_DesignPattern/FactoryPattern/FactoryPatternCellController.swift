//
//  FactoryPatternCellController.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/06/02.
//

import UIKit

protocol CollectionCellController {
	static func registerCell(on collectionView: UICollectionView)
	func cellFromCollectionView(_ collectionView: UICollectionView, itemAt indexPath: IndexPath) -> UICollectionViewCell
	func didSelectCell(itemAt indexPath: IndexPath)
}

protocol CollectionCellControllerFactory {
	func registerCells(on collectionView: UICollectionView)
}

class SampleCollectionViewCellControllerFactory: CollectionCellControllerFactory {
	func registerCells(on collectionView: UICollectionView) {
		SampleCollectionViewCellController.registerCell(on: collectionView)
	}

	func cellController(with item: ItemModelProtocol) -> [CollectionCellController] {	// section이 있는 경우 [[]] return
		return [SampleCollectionViewCellController(item: item)]
	}
}

protocol ItemModelProtocol {
}

class SampleCollectionViewCellController: CollectionCellController {

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

// 팩토리 메서드 패턴으로 Collection View Cell 관리
// 새로운 cell을 추가하려고 할 때 view controller의 수정이 필요 없다.
// 하지만 새로운 collection view에 대한 factory pattern을 적용할 때 재사용 되는 코드들이 많음...
// collection view마다 데이터 모델이 다르기 때문에 cell controller factory가 수정이 많이 될것 같음
// https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-1-of-3-18c6cd10a0b3
// 해당 url의 방식을 참고해서 공부해보자!
