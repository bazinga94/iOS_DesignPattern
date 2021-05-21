//
//  ObserverPattern.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import Foundation

protocol Observer {
	var id: Int { get }
	func update(_ notifyValue: Int)
}

class Subject {
	private var observerArray: [Observer] = [Observer]()
	private var _number = Int()

	/// 값이 변경되면 notify() 호출
	var number: Int {
		set {
			_number = newValue
			notify()
		}

		get {
			return _number
		}
	}

	/// Observer 등록
	/// - Parameter observer: Observer
	func attachObserver(observer: Observer) {
		observerArray.append(observer)
	}

	/// Observer 알림
	func notify() {
		for observer in observerArray {
			observer.update(number)
		}
	}
}

