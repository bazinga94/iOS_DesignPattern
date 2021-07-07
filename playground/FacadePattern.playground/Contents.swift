import Foundation

// https://icksw.tistory.com/246 참고

// 재고 관리
class AvailableProduct {
	var productList: [Product: Int] = [:]

	init(productList: [Product: Int]) {
		self.productList = productList
	}
}

// 고객
struct Customer {
	let identifier: String
	var name: String
	var address: String
}

// 주문 현황
class OrderList {
	var orderList: [Customer: [Product]] = [:]
}

// 상품
struct Product {
	let identifier: String
	var name: String
	var cost: Int
}

extension Product: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(identifier)
	}
	static func == (lhs: Product, rhs: Product) -> Bool {
		return lhs.identifier == rhs.identifier
	}
}

extension Customer: Hashable {
	func hash(into hasher: inout Hasher) {
		hasher.combine(identifier)
	}
	static func == (lhs: Customer, rhs: Customer) -> Bool {
		return lhs.identifier == rhs.identifier
	}
}

class OrderFacade {
	let productDB: AvailableProduct
	let orderDB: OrderList

	init(productDB: AvailableProduct, orderDB: OrderList) {
		self.productDB = productDB
		self.orderDB = orderDB
	}

	func order(product: Product, customer: Customer) {
		print("\(customer.name)님이 \(product.name)를 주문하셨습니다.")
		if let count = self.productDB.productList[product] {
			if count == 0 {
				print("\(product.name) 재고가 없습니다.\n")
			} else if count > 0 {
				self.productDB.productList[product] = count - 1

				var orderList = self.orderDB.orderList[customer, default: []]
				orderList.append(product)
				self.orderDB.orderList[customer] = orderList
				print("\(customer.name)님의 \(product.name)를 주문 접수 완료!\n")
			}
		} else {
			print("존재하지 않는 제품입니다.\n")
		}
	}
}

let macBook = Product(identifier: "product-01", name: "MacBook", cost: 2000000)
let iPad = Product(identifier: "product-02", name: "iPad", cost: 1200000)
let iPhone = Product(identifier: "product-03", name: "iPhone", cost: 1000000)

let productDB = AvailableProduct(productList: [macBook: 4, iPad: 3, iPhone: 1])

let pingu = Customer(identifier: "customer-01", name: "Pingu", address: "남극 이글루")
let ick = Customer(identifier: "customer-02", name: "Ick", address: "한국 서울")

let orderFacade = OrderFacade(productDB: productDB, orderDB: OrderList())

orderFacade.order(product: iPhone, customer: pingu)
orderFacade.order(product: iPhone, customer: pingu)
