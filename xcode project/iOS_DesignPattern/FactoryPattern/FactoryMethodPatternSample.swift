//
//  FactoryMethodPatternSample.swift
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
// 예를 들어 CheesePizza, PepperoniPizza
// cut 단계가 없어지거나~? 하면 어쩌지 -> 추상 팩토리 패턴

// 팩토리 메서드 패턴의 한계점 예시
// SimplePizzaFactory가 아닌 새로운 Factory가 필요한 경우??

// 팩토리 메서드 패턴 을 이용한 객체 생성은 관련 있는 여러 개의 객체를 일관성 있는 방식으로 생성하는 경우에 많은 코드 변경이 발생 하게 된다


// 두 가지 팩토리 패턴의 예시 작성
protocol 빵 {
	func 반죽()
	func 오븐에굽기()
}

class 단팥빵: 빵 {
	func 반죽() {
	}

	func 오븐에굽기() {
	}
}

class 식빵: 빵 {
	func 반죽() {
	}

	func 오븐에굽기() {
	}
}

class 밤빵: 빵 {
	func 반죽() {
	}

	func 오븐에굽기() {
	}
}

enum 빵타입 {
	case 식빵
	case 단팥빵
	case 밤빵
}

// 팩토리 메서드 패턴 예시

class 빵Factory {

	let 빵type: 빵타입

	init(type: 빵타입) {
		self.빵type = type
	}

	func create빵() -> 빵 {
		switch 빵type {
			case .단팥빵:
				return 단팥빵()
			case .식빵:
				return 식빵()
			case .밤빵:
				return 밤빵()
		}
	}
}

func factoryMethod() {
	let factory = 빵Factory(type: .단팥빵)
	let 빵 = factory.create빵()
	빵.반죽()
	빵.오븐에굽기()
}

// 추상 팩토리 패턴 예시

protocol 빵FactoryProtocol {
	func create빵() -> 빵
}

class 식빵Factory: 빵FactoryProtocol {
	func create빵() -> 빵 {
		return 식빵()
	}
}

class 단팥빵Factory: 빵FactoryProtocol {
	func create빵() -> 빵 {
		return 단팥빵()
	}
}

class 빵집주인 {
	private let factory: 빵FactoryProtocol

	init(factory: 빵FactoryProtocol) {
		self.factory = factory
	}

	func 빵제공() -> 빵 {
		let bread = factory.create빵()
		bread.반죽()
		bread.오븐에굽기()
		return bread
	}
}

func abstractFactory() {
	let client = 빵집주인(factory: 식빵Factory())
	let 빵 = client.빵제공()
}

// 팩토리 메서드 패턴은 팩토리 클래스에 의존, 추상 팩토리 패턴에서는 추상화된 protocol에 의존한다
// 빵FactoryProtocol는 인스턴스를 만드는 행위만 정의(추상화) 하고, 행위에 대한 구현은 해당 protocol을 채택한 factory들의 메서드에서 수행한다.
// 팩토리 메서드 패턴의 switch, if-else 로직에서 자유로움, 팩토리 메서드 패턴에서는 인스턴스를 타입에 따라 생성하고 분기문이 들어가야함(!!) -> 의존성 발생
// but 추상 팩토리 패턴에서는 객체가 늘어날 때 마다 하위 클래스를 새로 재정의해야함.. 클래스가 계속 늘어난다.
