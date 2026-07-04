import Foundation

private struct CatalogProduct {
    let name: String
    let price: Double
    let category: ItemCategory
}

enum SampleData {
    static let driverHome = StoreLocation(name: "Downtown San Jose", latitude: 37.3382, longitude: -121.8863, servesCategories: [])

    // Groceries + clothing + general merchandise.
    static let walmartStoryRoad = StoreLocation(name: "Walmart Supercenter - Story Rd", latitude: 37.3352, longitude: -121.8712, servesCategories: [.groceries, .clothing, .general])
    static let walmartCottleRoad = StoreLocation(name: "Walmart - Cottle Rd", latitude: 37.2496, longitude: -121.8267, servesCategories: [.groceries, .clothing, .general])

    // Groceries + clothing.
    static let targetEastridge = StoreLocation(name: "Target - Eastridge", latitude: 37.3315, longitude: -121.8630, servesCategories: [.groceries, .clothing])

    // Electronics only.
    static let bestBuyAlmaden = StoreLocation(name: "Best Buy - Almaden Expy", latitude: 37.2789, longitude: -121.9280, servesCategories: [.electronics])

    // Makeup only.
    static let sephoraValleyFair = StoreLocation(name: "Sephora - Westfield Valley Fair", latitude: 37.3252, longitude: -121.9459, servesCategories: [.makeup])
    static let ultaBlossomHill = StoreLocation(name: "Ulta Beauty - Blossom Hill Rd", latitude: 37.2481, longitude: -121.8865, servesCategories: [.makeup])

    static let allStores: [StoreLocation] = [
        walmartStoryRoad, walmartCottleRoad, targetEastridge,
        bestBuyAlmaden, sephoraValleyFair, ultaBlossomHill
    ]

    // Streets used to generate random residential drop-off addresses around San Jose.
    private static let sanJoseStreets = [
        "Santa Clara St", "First St", "Almaden Blvd", "Story Rd", "Capitol Expy",
        "Blossom Hill Rd", "Winchester Blvd", "Bascom Ave", "Meridian Ave",
        "Tully Rd", "King Rd", "White Rd", "Cottle Rd", "Monterey Rd", "Alum Rock Ave"
    ]

    private static func randomSanJoseAddress() -> StoreLocation {
        let number = Int.random(in: 100...9999)
        let street = sanJoseStreets.randomElement() ?? "Santa Clara St"
        let latitude = Double.random(in: 37.24...37.42)
        let longitude = Double.random(in: -121.95...(-121.75))
        return StoreLocation(
            name: "\(number) \(street), San Jose",
            latitude: latitude,
            longitude: longitude,
            servesCategories: []
        )
    }

    // Real products from Easy Delivery's catalog (DummyJSON), grouped by category.
    private static let catalog: [CatalogProduct] = [
        // groceries
        CatalogProduct(name: "Apple", price: 1.99, category: .groceries),
        CatalogProduct(name: "Beef Steak", price: 12.99, category: .groceries),
        CatalogProduct(name: "Cat Food", price: 8.99, category: .groceries),
        CatalogProduct(name: "Chicken Meat", price: 9.99, category: .groceries),
        CatalogProduct(name: "Cooking Oil", price: 4.99, category: .groceries),
        CatalogProduct(name: "Cucumber", price: 1.49, category: .groceries),
        CatalogProduct(name: "Dog Food", price: 10.99, category: .groceries),
        CatalogProduct(name: "Eggs", price: 2.99, category: .groceries),
        CatalogProduct(name: "Fish Steak", price: 14.99, category: .groceries),
        CatalogProduct(name: "Green Bell Pepper", price: 1.29, category: .groceries),
        CatalogProduct(name: "Green Chili Pepper", price: 0.99, category: .groceries),
        CatalogProduct(name: "Honey Jar", price: 6.99, category: .groceries),
        CatalogProduct(name: "Ice Cream", price: 5.49, category: .groceries),
        CatalogProduct(name: "Juice", price: 3.99, category: .groceries),
        CatalogProduct(name: "Kiwi", price: 2.49, category: .groceries),

        // clothing
        CatalogProduct(name: "Blue & Black Check Shirt", price: 29.99, category: .clothing),
        CatalogProduct(name: "Gigabyte Aorus Men Tshirt", price: 24.99, category: .clothing),
        CatalogProduct(name: "Man Plaid Shirt", price: 34.99, category: .clothing),
        CatalogProduct(name: "Man Short Sleeve Shirt", price: 19.99, category: .clothing),
        CatalogProduct(name: "Men Check Shirt", price: 27.99, category: .clothing),
        CatalogProduct(name: "Blue Frock", price: 29.99, category: .clothing),
        CatalogProduct(name: "Girl Summer Dress", price: 19.99, category: .clothing),
        CatalogProduct(name: "Gray Dress", price: 34.99, category: .clothing),
        CatalogProduct(name: "Short Frock", price: 24.99, category: .clothing),
        CatalogProduct(name: "Tartan Dress", price: 39.99, category: .clothing),

        // electronics
        CatalogProduct(name: "Apple iPhone Charger", price: 19.99, category: .electronics),
        CatalogProduct(name: "Beats Flex Wireless Earphones", price: 49.99, category: .electronics),
        CatalogProduct(name: "iPhone 12 Silicone Case with MagSafe Plum", price: 29.99, category: .electronics),
        CatalogProduct(name: "Monopod", price: 19.99, category: .electronics),
        CatalogProduct(name: "Selfie Lamp with iPhone", price: 14.99, category: .electronics),
        CatalogProduct(name: "Selfie Stick Monopod", price: 12.99, category: .electronics),

        // makeup
        CatalogProduct(name: "Essence Mascara Lash Princess", price: 9.99, category: .makeup),
        CatalogProduct(name: "Eyeshadow Palette with Mirror", price: 19.99, category: .makeup),
        CatalogProduct(name: "Powder Canister", price: 14.99, category: .makeup),
        CatalogProduct(name: "Red Lipstick", price: 12.99, category: .makeup),
        CatalogProduct(name: "Red Nail Polish", price: 8.99, category: .makeup),

        // general (kitchen-accessories, Walmart)
        CatalogProduct(name: "Bamboo Spatula", price: 7.99, category: .general),
        CatalogProduct(name: "Black Aluminium Cup", price: 5.99, category: .general),
        CatalogProduct(name: "Black Whisk", price: 9.99, category: .general),
        CatalogProduct(name: "Boxed Blender", price: 39.99, category: .general),
        CatalogProduct(name: "Carbon Steel Wok", price: 29.99, category: .general),
        CatalogProduct(name: "Chopping Board", price: 12.99, category: .general),
        CatalogProduct(name: "Citrus Squeezer Yellow", price: 8.99, category: .general),
        CatalogProduct(name: "Egg Slicer", price: 6.99, category: .general),
        CatalogProduct(name: "Fine Mesh Strainer", price: 9.99, category: .general),
        CatalogProduct(name: "Grater Black", price: 10.99, category: .general),
        CatalogProduct(name: "Hand Blender", price: 34.99, category: .general),
        CatalogProduct(name: "Ice Cube Tray", price: 5.99, category: .general),
        CatalogProduct(name: "Knife", price: 14.99, category: .general),
        CatalogProduct(name: "Lunch Box", price: 12.99, category: .general),
        CatalogProduct(name: "Mug Tree Stand", price: 15.99, category: .general),
        CatalogProduct(name: "Pan", price: 24.99, category: .general),
        CatalogProduct(name: "Spice Rack", price: 19.99, category: .general),
        CatalogProduct(name: "Tray", price: 16.99, category: .general),
        CatalogProduct(name: "Wooden Rolling Pin", price: 11.99, category: .general)
    ]

    private static let orderBudget = 50.0

    private static func pickupStores(for category: ItemCategory) -> [StoreLocation] {
        allStores.filter { $0.servesCategories.contains(category) }
    }

    private static func randomItems(for category: ItemCategory) -> [OrderItem] {
        let pool = catalog.filter { $0.category == category }
        let targetCount = Int.random(in: 2...10)
        var items: [OrderItem] = []
        var total = 0.0

        for product in pool.shuffled() {
            guard items.count < targetCount else { break }
            let quantity = Int.random(in: 1...2)
            let lineTotal = product.price * Double(quantity)
            guard total + lineTotal < orderBudget else { continue }
            items.append(OrderItem(name: product.name, price: product.price, quantity: quantity))
            total += lineTotal
        }

        if items.isEmpty, let cheapest = pool.min(by: { $0.price < $1.price }) {
            items.append(OrderItem(name: cheapest.name, price: cheapest.price, quantity: 1))
        }

        return items
    }

    private static func makeOrder(category: ItemCategory, payout: Double) -> DriverOrder {
        let pickup = pickupStores(for: category).randomElement() ?? walmartStoryRoad
        let dropoff = randomSanJoseAddress()
        return DriverOrder(pickup: pickup, dropoff: dropoff, payout: payout, items: randomItems(for: category))
    }

    static let orders: [DriverOrder] = [
        makeOrder(category: .groceries, payout: 8.50),
        makeOrder(category: .clothing, payout: 9.75),
        makeOrder(category: .electronics, payout: 13.00),
        makeOrder(category: .makeup, payout: 11.25),
        makeOrder(category: .general, payout: 10.50)
    ]
}
