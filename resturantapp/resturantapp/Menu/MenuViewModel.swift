
import SwiftUI

@Observable
final class MenuViewModel {
    private(set) var data: MenuData?
    let decoder: LocalFileDataDecoder
    
    init(data: MenuData? = nil, decoder: LocalFileDataDecoder) {
        self.data = data
        self.decoder = decoder
    }
    
    var categories: [FoodCategory] {
        data?.categories ?? []
    }
    
    func getMenuItems(_ category: FoodCategory) -> [Food] {
        let items = data?.menuItems.filter { item in
            item.categoryId == category.id
        }
        return items ?? []
    }
    
    func loadData() {
        do {
            let data: MenuData = try decoder.decode(fileName: "Database",  fileExtension: "json")
            self.data = data
        } catch {
            print("Failed to load or decode database")
        }
    }
}
