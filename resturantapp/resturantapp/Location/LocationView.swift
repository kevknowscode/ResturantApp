
import SwiftUI

struct LocationView: View {
    @Environment(\.colorScheme) var colorMode
    @State private var viewModel = LocationsViewModel(data: [], decoder: LocalFileDataDecoder())
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.cyan, colorMode == .dark ? .black : .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack {
                    List(viewModel.data) { place in
                        Text("\(place.address) - \(place.state)")
                    }
                    .navigationTitle("Our Locations")
                    .scrollContentBackground(.hidden)
                    
                    Button("Search Location") {
                        showSheet.toggle()
                    }
                    .font(.system(size: 14, weight: .medium))
                    .padding(8)
                    .frame(width: 160, height: 35)
                    .background(.cyan)
                    .foregroundStyle(.black)
                    .cornerRadius(12)
                }
            }
            .sheet(isPresented: $showSheet) {
                FindLocationView(locations: viewModel.data)
            }
            .onAppear {
                viewModel.loadData()
            }
        }
    }
}

struct FindLocationView: View {
    @Environment(\.colorScheme) var colorMode
    
    var locations: [Location]
    @State private var enteredlocation: String = ""
    @State private var filteredLocations: [Location] = []
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.cyan,  colorMode == .dark ? .black : .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Text("Enter Location")
                        .font(.title3)
                        .foregroundStyle(.white)
                    
                    TextField("Enter your area", text: $enteredlocation)
                        .frame(width: 300, height: 40)
                        .textFieldStyle(.roundedBorder).foregroundStyle(.white)
                    
                    Button("Find Locations") {
                        filteredLocations = locations.filter {
                            $0.state.lowercased() == enteredlocation.lowercased()
                        }
                        showSheet = true
                    }
                    .font(.system(size: 14, weight: .medium))
                    .padding(8)
                    .frame(width: 160, height: 35)
                    .background(.white)
                    .foregroundStyle(.black)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .sheet(isPresented: $showSheet) {
            FoundLocationsView(foundLocations: filteredLocations)
        }
    }
}

struct FoundLocationsView: View {
    @Environment(\.colorScheme) var colorMode
    var foundLocations: [Location]
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.cyan, colorMode == .dark ? .black : .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
                VStack {
                    if foundLocations.isEmpty {
                        Text("No results found.")
                            .foregroundStyle(.white)
                            .padding()
                    } else {
                        List(foundLocations) { location in
                            Text("\(location.address) – \(location.state)")
                        }
                        .scrollContentBackground(.hidden)
                        .navigationTitle("Locations: ")
                    }
                }
            }
        }
    }
}

#Preview {
    LocationView()
}
