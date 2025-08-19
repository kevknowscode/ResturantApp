
import SwiftUI

struct DishesListView: View {
    @Binding var cart: [Food]
    
    let title: String
    let items: [Food]
    let gradientColors: [Color]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: gradientColors, startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                List(items) { item in
                    Button(action: {
                        cart.append(item)
                    }) {
                        HStack {
                            Text("\(item.name)")
                            Spacer()
                            Text("$\(item.price, specifier: "%.2f")")
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .scrollContentBackground(.hidden)
                .navigationTitle(title)
            }
        }
    }
}

#Preview {
    DishesListView(cart: .constant(Food.mocks), title: "Breakfast", items: Food.mocks, gradientColors: [.green, .purple])
}

#Preview {
    DishesListView(cart: .constant(Food.mocks), title: "Breakfast", items: Food.mocks, gradientColors: [.pink, .yellow])
}
