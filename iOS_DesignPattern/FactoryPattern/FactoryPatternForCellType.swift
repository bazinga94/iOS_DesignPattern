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

protocol ReusableCell: class {
	associatedtype CellHolder: ReusableCellHolder
}

extension UITableViewCell: ReusableCell {
	typealias CellHolder = UITableView
}

//extension UITableViewCell: ReusableCell {
//	typealias CellHolder = UICollectionView
//} -> compile error 발생

extension UICollectionViewCell: ReusableCell {
	typealias CellHolder = UICollectionView
}

protocol ReusableCellHolder: class {
	associatedtype CellType: ReusableCell where CellType.CellHolder == Self

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

protocol Item {
}

class SampleTableCellController: CellController<UITableView> {
	let item: Item

	init(item: Item) {
		self.item = item
	}

	override class var cellClass: AnyClass {
		return SampleTableCellController.self
	}

	override func configureCell(_ cell: UITableViewCell) {
//		let sampleCell = cell as! SampleCell
//		... cell configure 로직
	}

	override func didSelectCell(itemAt indexPath: IndexPath) {
//		... cell 선택 로직
	}
}

// -> Bundle, Nib 에 대해 신경쓰거나 register를 따로 해줄 필요가 없음
// dequeue cell을 해줄 필요 없이 configure cell 만 해주면 됨

protocol ItemList {
	var item: Item { get }
}

class SampleTableCellControllerFactory {
	func registerCells(on tableView: UITableView) {
		SampleTableCellController.registerCell(on: tableView)
	}

	func cellController(with items: ItemList) -> [CellController<UITableView>] {
		return [SampleTableCellController(item: items.item)]
	}
}

// -> 여전히 불편한 점은 있음!, SampleTableCellController에서 cellClass를 지정해주는 부분이나 configureCell에서 Cell을 타입 캐스팅 해줘야 한다.
// ReusableCell을 선언

//protocol ReusableCell: class {
//	associatedtype CellHolder: ReusableCellHolder
//}
