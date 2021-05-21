//
//  ObserverPattern.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/21.
//

import Foundation

protocol Observer {
	func update(_ notifyValue: String)
}

class Subject {
	private var observerArray: [Observer] = [Observer]()
	private var _text = String()

	/// 값이 변경되면 notify() 호출
	var text: String {
		set {
			_text = newValue
			notify()
		}

		get {
			return _text
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
			observer.update(text)
		}
	}
}

class Ian: Observer {
	private var subject: Subject = Subject()
	weak var delegate: IanDelegate?

	init(subject: Subject, delegate: IanDelegate) {
		self.subject = subject
		self.delegate = delegate
		self.subject.attachObserver(observer: self)
	}

	func update(_ notifyValue: String) {
		print("Ian에서 \(notifyValue) 변경")
		delegate?.changeLabel(text: notifyValue)
	}
}

class Haley: Observer {
	private var subject: Subject = Subject()

	init(subject: Subject) {
		self.subject = subject
		self.subject.attachObserver(observer: self)
	}

	func update(_ notifyValue: String) {
		print("Haley에서 \(notifyValue) 변경")
	}
}

class Novelyn: Observer {
	private var subject: Subject = Subject()

	init(subject: Subject) {
		self.subject = subject
		self.subject.attachObserver(observer: self)
	}

	func update(_ notifyValue: String) {
		print("Novelyn에서 \(notifyValue) 변경")
	}
}
