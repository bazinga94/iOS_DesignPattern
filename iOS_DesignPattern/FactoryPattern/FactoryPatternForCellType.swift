//
//  FactoryPatternForCellType.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/06/08.
//

import UIKit

// https://tech.busuu.com/dealing-with-different-kinds-of-cells-in-swift-part-2-of-3-3fe73b0c50c6 참고
// 기본적으로 collection view와 table view는 동일한 cell 처리 구조를 가지고 있음
// associated type과 protocol을 활용하여 더 간결한 controller를 만들어 보자

protocol ReusableCellHolder: class {
	associatedtype CellType

	func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String)
	func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> CellType
}

extension UITableView: ReusableCellHolder {

	func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) {
		register(nib, forCellReuseIdentifier: identifier)
	}

	func dequeueReusableCell(withReuseIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
		return dequeueReusableCell(withIdentifier: identifier, for: indexPath)
	}
}
// CellType은 UITableViewCell로 지정

extension UICollectionView: ReusableCellHolder {

}
// UICollectionView에는 이미 해당 protocol이 구현되어 있다

protocol CellControllerType {
	associatedtype ViewType: ReusableCellHolder

	static func registerCell(on reusableCellHolder: ViewType)
	func cellFromReusableCellHolder(_ reusableCellHolder: ViewType, forIndexPath indexPath: IndexPath) -> ViewType.CellType
	func didSelectCell(itemAt indexPath: IndexPath)
}

class CellController<T: ReusableCellHolder>: CellControllerType {

	class var cellClass: AnyClass {		// override 가능
		fatalError("Must be implemented by children")
	}

	static var cellIdentifier: String {
		return String(describing: cellClass)
	}

	static func registerCell(on reusableCellHolder: T) {
		let bundle = Bundle(for: cellClass)
		let nib = UINib(nibName: cellIdentifier, bundle: bundle)
		reusableCellHolder.register(nib, forCellWithReuseIdentifier: cellIdentifier)
	}

	func cellFromReusableCellHolder(_ reusableCellHolder: T, forIndexPath indexPath: IndexPath) -> T.CellType {
		let cell = reusableCellHolder.dequeueReusableCell(withReuseIdentifier: type(of: self).cellIdentifier, for: indexPath)
		configureCell(cell)
		return cell
	}

	func configureCell(_ cell: T.CellType) {
		// 자식 클래스에서 override하여 구현
	}

	func didSelectCell(itemAt indexPath: IndexPath) {
		// 자식 클래스에서 override하여 구현
	}
}
