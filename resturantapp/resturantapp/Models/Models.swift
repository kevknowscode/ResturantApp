
import Foundation

struct LocationData: Decodable {
    let items: [Location]
}

struct Location: Hashable, Identifiable, Decodable {
    var id: String {
        address + state
    }
    
    let address: String
    let state: String
}

struct FoodCategory: Decodable, Identifiable, Hashable {
    let id: Int
    let title: String
}

struct Food: Decodable, Identifiable {
    var id: String {
        name
    }
    
    let categoryId: Int
    let name: String
    let price: Double
}

struct MenuData: Decodable {
    let tax: Double
    let categories: [FoodCategory]
    let menuItems: [Food]
}
