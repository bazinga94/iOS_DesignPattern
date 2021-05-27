//
//  AbstractFactoryPattern.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/27.
//

import Foundation

// 출처: https://gaki2745.github.io/ios/2020/04/12/iOS-DesignPattern-05/

protocol PizzaStoreProtocol {
	func createPizza(_ type: String) -> Pizza?
	func orderPizza()
	func deliveryPizza()
}

class NewyorkCheesePizza: Pizza {
}

class NewyorkPepperoniPizza: Pizza {
}

class ChicagoCheesePizza: Pizza {
}

class ChicagoPepperoniPizza: Pizza {
}

class NewyorkPizzaStore: PizzaStoreProtocol {
	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "cheese":
				pizza = NewyorkCheesePizza()
			case "Peperoni":
				pizza = NewyorkPepperoniPizza()
			default:
				pizza = nil
		}
		return pizza
	}

	func orderPizza() { }
	func deliveryPizza() { }
}

class ChicagoPizzaStore: PizzaStoreProtocol {

	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "cheese":
				pizza = ChicagoCheesePizza()
			case "Peperoni":
				pizza = ChicagoPepperoniPizza()
			default:
				pizza = nil
		}
		return pizza
	}

	func orderPizza() { }
	func deliveryPizza() { }
}
