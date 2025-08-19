import SwiftUI

struct ContentView: View {
    @State private var cartViewModel = CartViewModel()
    @State private var menuViewModel = MenuViewModel(data: nil, decoder: LocalFileDataDecoder())
    
    var body: some View {
        ZStack {
            VStack {
                TabView {
                    MenuView(food: $cartViewModel.items, viewModel: menuViewModel)
                        .tabItem {
                            Image(systemName: "fork.knife")
                            Text("Menu")
                        }
                        .onAppear { //TODO get rid of it when we have Firebase
                            menuViewModel.loadData()
                            cartViewModel.setTax(menuViewModel.data?.tax ?? 0)
                        }
                    LocationView()
                        .tabItem {
                            Image(systemName: "mappin")
                            Text("Location")
                        }
                    MyCartView(cartViewModel: cartViewModel)
                        .tabItem {
                            Image(systemName: "cart")
                            Text("My Cart")
                        }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
