//
//  FactoryMethodPattern.swift
//  iOS_DesignPattern
//
//  Created by Jongho Lee on 2021/05/27.
//

import Foundation

// 출처: https://gaki2745.github.io/ios/2020/04/12/iOS-DesignPattern-05/

// MARK: - AS-IS

class Pizza {
	func prepare() {
	}

	func bake() {
	}

	func cut() {
	}

	func box() {
	}
}

class CheesePizza: Pizza {
}

class PepperoniPizza: Pizza {
}

class ClamPizza: Pizza {
}

class VeggiePizza: Pizza {
}

func orderPizza(_ type: String) -> Pizza {
	var pizza = Pizza()

	switch type {
		case "cheese":
			pizza = CheesePizza()
		case "Peperoni":
			pizza = PepperoniPizza()
		case "Clam":
			pizza = ClamPizza()
		case "Veggie":
			pizza = VeggiePizza()
		default: break
	}

	pizza.prepare()
	pizza.bake()
	pizza.cut()
	pizza.box()
	return pizza
}
// 메뉴가 변경되거나 추가되면 함수 수정이 많이 필요함

// MARK: - TO-BE
class SimplePizzaFactory {
	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "cheese":
				pizza = CheesePizza()
			case "Peperoni":
				pizza = PepperoniPizza()
			case "Clam":
				pizza = ClamPizza()
			case "Veggie":
				pizza = VeggiePizza()
			default:
				pizza = nil
		}
		return pizza
	}
}

 class PizzaStore {
	var factory: SimplePizzaFactory

	init(factory: SimplePizzaFactory) {
		self.factory = factory
	}

	func orderPizza(_ type: String) -> Pizza? {

		// 팩토리 객체에 있는 create 메서드를 사용하여 객체 생성
		guard let pizza = factory.createPizza(type) else { return nil }

		pizza.prepare()
		pizza.bake()
		pizza.cut()
		pizza.box()
		return pizza
	}
}