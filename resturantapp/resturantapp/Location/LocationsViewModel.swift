
import SwiftUI

@Observable
final class LocationsViewModel {
    var data: [Location]
    let decoder: LocalFileDataDecoder
    
    init(data: [Location], decoder: LocalFileDataDecoder) {
        self.data = data
        self.decoder = decoder
    }
    
    func loadData() {
        do {
            let data: LocationData = try decoder.decode(fileName: "Locations",  fileExtension: "json")
            self.data = data.items
        } catch {
            print("Failed to load or decode locations")
        }
    }
}
