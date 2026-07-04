import Foundation

enum SampleData {
    static let driverHome = StoreLocation(name: "Downtown San Jose", latitude: 37.3382, longitude: -121.8863)

    static let walmartStoryRoad = StoreLocation(name: "Walmart Supercenter - Story Rd", latitude: 37.3352, longitude: -121.8712)
    static let targetEastridge = StoreLocation(name: "Target - Eastridge", latitude: 37.3315, longitude: -121.8630)
    static let homeDepotSanCarlos = StoreLocation(name: "Home Depot - W San Carlos St", latitude: 37.3277, longitude: -121.9127)
    static let costcoColeman = StoreLocation(name: "Costco - Coleman Ave", latitude: 37.3396, longitude: -121.9209)
    static let bestBuyAlmaden = StoreLocation(name: "Best Buy - Almaden Expy", latitude: 37.2789, longitude: -121.9280)
    static let walmartCottleRoad = StoreLocation(name: "Walmart - Cottle Rd", latitude: 37.2496, longitude: -121.8267)

    static let orders: [DriverOrder] = [
        DriverOrder(pickup: walmartStoryRoad, dropoff: targetEastridge, payout: 8.50),
        DriverOrder(pickup: homeDepotSanCarlos, dropoff: costcoColeman, payout: 11.25),
        DriverOrder(pickup: targetEastridge, dropoff: bestBuyAlmaden, payout: 9.75),
        DriverOrder(pickup: costcoColeman, dropoff: walmartCottleRoad, payout: 13.00),
        DriverOrder(pickup: walmartCottleRoad, dropoff: homeDepotSanCarlos, payout: 10.50)
    ]
}
