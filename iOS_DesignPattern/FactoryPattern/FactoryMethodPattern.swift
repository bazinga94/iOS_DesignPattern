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
		print("pizza prepare")
	}

	func bake() {
		print("pizza bake")
	}

	func cut() {
		print("pizza cut")
	}

	func box() {
		print("pizza box")
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
		case "Cheese":
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

// MARK: - TO-BE

class SimplePizzaFactory {
	func createPizza(_ type: String) -> Pizza? {
		var pizza: Pizza?
		switch type {
			case "Cheese":
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
// 객체 생성 처리를 서브 클래스로 분리하여 처리함,
// -> 클래스 객체를 서브 클래스에서 생성
// 객체를 직접 만들지 않고 팩토리 메서드를 통해서 생성

// -> 메뉴가 변경되거나 추가되면 함수 수정이 많이 필요함
// cut 단계가 없어지거나~? 하면 어쩌지 -> 추상 팩토리 패턴

// 팩토리 메서드 패턴의 한계점 예시
// SimplePizzaFactory가 아닌 새로운 Factory가 필요한 경우



// 팩토리 메서드 패턴 을 이용한 객체 생성은 관련 있는 여러 개의 객체를 일관성 있는 방식으로 생성하는 경우에 많은 코드 변경이 발생 하게 된다
