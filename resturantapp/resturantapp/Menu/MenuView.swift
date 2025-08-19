
import SwiftUI

struct MenuView: View {
    @Environment(\.colorScheme) var colorMode
    @Binding var food: [Food]
    
    let viewModel: MenuViewModel
    @State private var selectedCategory: FoodCategory? = nil
    
    var backgroundColors: [Color] {
        [.cyan, colorMode == .dark ? .black : .white]
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: backgroundColors, startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(spacing: 40) {
                    ForEach(viewModel.categories) { optionType in
                        Button {
                            selectedCategory = optionType
                        } label: {
                            Text(optionType.title)
                        }
                        .frame(width: 250, height: 70)
                        .background(LinearGradient(colors: [.cyan, .white, .cyan], startPoint: .topLeading, endPoint: .bottom))
                        .foregroundStyle(colorMode == .dark ? .black : .black)
                        .cornerRadius(100)
                        .font(.system(size: 25, weight: .medium))
                        .padding(.top, 16)
                    }
                }
                .navigationDestination(item: $selectedCategory) { item in
                    DishesListView(cart: $food, title: item.title, items: viewModel.getMenuItems(item), gradientColors: backgroundColors)
                }
                
            }
            .navigationTitle("Choose Menu")
        }
    }
}


#Preview {
    MenuView(food: .constant(Food.mocks), viewModel: MenuViewModel(data: nil, decoder: LocalFileDataDecoder()))
}
