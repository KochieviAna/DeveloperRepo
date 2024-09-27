import UIKit

//MARK: 1.შექმენით FoodGroup Enum, რომელიც მოიცავს: fruit, vegetable, protein, dairy, grain ჩამონათვალს.

enum FoodGroup {
    case fruit
    case vegetable
    case protein
    case dairy
    case grain
}

//MARK: 2.შექმენით enum ProductStatus (გაყიდულია, ხელმისაწვდლომია ქეისებით)

enum ProductStatus {
    case sold
    case available
}

//MARK: შექმენით სტრუქტურა Product რომელიც შეიცავს ცვლადებს: name, category(FoodGroup), price, info(რომელიც ფასის და სახელის ინფოს მოგვაწვდის), ფასდაკლება, მასა, კალორია100გრამზე, ProductStatus ცვლადი ფუნქციები: ფადაკლებული ფასის ჩვენება, ყიდვა, გამოითვალე კალორია მასაზე დაყრდნობით.

struct Product {
    var name: String
    var category: FoodGroup
    var price: Double
    var info: String {
        "The price of product is \(price) and the name of product is \(name)."
    }
    var sale: Double
    var mass:Double
    var caloriesCountOnHundredGram: Double
    var status: ProductStatus
    
    mutating func discount() -> Double {
        price * (1 - sale)
    }
    
    mutating func purchase() {
        status = .sold
        print("\(name) has been sold")
    }
    
    mutating func countingCalories() -> Double {
        caloriesCountOnHundredGram / 100 * mass
    }
}

//MARK: 4.შექმენით მასივი პროდუქტებით სადაც მინიმუმ 15 პროდუქტი გექნებათ.

let productOne = Product(
    name: "Tomato",
    category: .fruit,
    price: 2.3,
    sale: 0.1,
    mass: 500.25,
    caloriesCountOnHundredGram: 22.0,
    status: .available
)

let productTwo = Product(
    name: "Cucumber",
    category: .vegetable,
    price: 3.3,
    sale: 0.2,
    mass: 500.2,
    caloriesCountOnHundredGram: 5.0,
    status: .sold
)

let productThree = Product(
    name: "Eggplant",
    category: .vegetable,
    price: 4.6,
    sale: 0.0,
    mass: 240.9,
    caloriesCountOnHundredGram: 54.0,
    status: .available
)

let productFour = Product(
    name: "Beef Steak",
    category: .protein,
    price: 35.98,
    sale: 0.23,
    mass: 300.25,
    caloriesCountOnHundredGram: 22.0,
    status: .sold
)

let productFive = Product(
    name: "Cottage Cheese",
    category: .dairy,
    price: 4.5,
    sale: 0.35,
    mass: 200.0,
    caloriesCountOnHundredGram: 35.0,
    status: .available
)

let productSix = Product(
    name: "Rice",
    category: .grain,
    price: 4.3,
    sale: 0.0,
    mass: 500.0,
    caloriesCountOnHundredGram: 60.35,
    status: .available
)

let productSeven = Product(
    name: "Orange",
    category: .fruit,
    price: 3.35,
    sale: 0.11,
    mass: 1000.0,
    caloriesCountOnHundredGram: 47.0,
    status: .available
)

let productEight = Product(
    name: "Carrot",
    category: .vegetable,
    price: 3.9,
    sale: 0.15,
    mass: 1000.0,
    caloriesCountOnHundredGram: 41.0,
    status: .sold
)

let productNine = Product(
    name: "Chicken Breast",
    category: .protein,
    price: 11.95,
    sale: 0.22,
    mass: 500.0,
    caloriesCountOnHundredGram: 165.0,
    status: .available
)

let productTen = Product(
    name: "Salmon Fillet",
    category: .protein,
    price: 40.56,
    sale: 0.0,
    mass: 400.0,
    caloriesCountOnHundredGram: 208.0,
    status: .sold
)

let productEleven = Product(
    name: "Milk",
    category: .dairy,
    price: 4.5,
    sale: 0.35,
    mass: 1000.0,
    caloriesCountOnHundredGram: 42.0,
    status: .available
)

let productTwelve = Product(
    name: "Almonds",
    category: .protein,
    price: 25.0,
    sale: 0.12,
    mass: 500.0,
    caloriesCountOnHundredGram: 576.0,
    status: .sold
)

let productThirteen = Product(
    name: "Oats",
    category: .grain,
    price: 3.6,
    sale: 0.0,
    mass: 300.25,
    caloriesCountOnHundredGram: 389.0,
    status: .available
)

let productFourteen = Product(
    name: "Tuna",
    category: .protein,
    price: 36.70,
    sale: 0.0,
    mass: 400.0,
    caloriesCountOnHundredGram: 250.0,
    status: .sold
)

let productFifteen = Product(
    name: "Mashrooms",
    category: .vegetable,
    price: 6.8,
    sale: 0.16,
    mass: 350.0,
    caloriesCountOnHundredGram: 57.0,
    status: .sold
)

var productsArray: [Product] = [productOne, productTwo, productThree, productFour, productFive, productSix, productSeven, productEight, productNine, productTen, productEleven, productTwelve, productThirteen, productFourteen, productFifteen]

print(productsArray)

print("---------------------------")

//MARK: 5.მიღებული მასივისგან შექმენით ახალი მასივი სადაც მხოლოდ პროდუქტის name იქნება ჩამოწერილი

let productsNameArray = productsArray.map {$0.name}

print(productsNameArray)

print("---------------------------")

//MARK: 6.თავდაპირველი მასივის ელემენტები დაალაგეთ ფასის ზრდადობის მიხედვით.

let productsSortedArray = productsArray.sorted { $0.price < $1.price }

print(productsSortedArray)

print("---------------------------")

//MARK: 7.რენდომ (1)კატეგორიის ყველა პროდუქტის სტატუსი შეცვალეთ ხელმისაწვდომიდან გაყიდულზე.

for product in 0..<productsArray.count {
    if productsArray[product].category == .grain && productsArray[product].status == .available {
        productsArray[product].status = .sold
    }
}
print(productsArray)

print("---------------------------")

//MARK: 8.გაიგეთ ყველა იმ პროდუქტის ერთეულის ჯამური ღირებულება რომელიც ხელმისაწვდომია.

let sumOfAvailableProductPrice = productsArray.filter { $0.status == .available }.reduce(0) { $0 + $1.price }

print(sumOfAvailableProductPrice)

print("---------------------------")
