//
//  Dynamic.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/24.
//

import Foundation

class Dynamic<T> {
	typealias Listener = (T) -> Void
	var listener: Listener?

	var value: T {
		didSet {
			listener?(value)
		}
	}

	init(_ value: T) {
		self.value = value
	}

	func bind(listener: Listener?) {
		self.listener = listener
		listener?(value)
	}
}
