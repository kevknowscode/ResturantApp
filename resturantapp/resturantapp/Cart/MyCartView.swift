
import SwiftUI

@Observable
final class CartViewModel {
    var items: [Food] = []
    private(set) var taxValue: Double?
    
    
    var subtotal: Double {
        calcSubtotal(list: items)
    }
    
    var tax: Double {
        calcTax(subtotal: subtotal)
    }
    
    var finalTotal: Double {
        calcTotal(subtotal: subtotal, tax: tax)
    }
    
    func calcSubtotal(list: [Food]) -> Double {
        var subtotal = 0.00
        for item in list {
            subtotal += item.price
        }
        return subtotal
    }
    
    func calcTax(subtotal: Double) -> Double {
        let tax = 0.0875
        return subtotal * tax
    }
    
    func calcTotal(subtotal: Double, tax: Double) -> Double {
        return subtotal + tax
    }
    
    func setTax(_ tax: Double) {
        self.taxValue = tax
    }
}

struct MyCartView: View {
    @Environment(\.colorScheme) var colorMode
    
    let cartViewModel: CartViewModel
    
    @State var sheetShowed = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, colorMode == .dark ? .black : .white], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                List(cartViewModel.items) { item in
                    Text("\(item.name) - $\(item.price, specifier: "%.2f")")
                }
                Text("Your total is $\(cartViewModel.finalTotal, specifier: "%.2f")")
                    .foregroundStyle(colorMode == .dark ? .white : .black)
                    .font(.title2)
                    .padding(.bottom, 100)
                Spacer()
                Button("Pay Now") {
                    sheetShowed.toggle()
                }
                .frame(width: 150, height: 60)
                .background(LinearGradient(colors: [.cyan, .white, .cyan], startPoint: .top, endPoint: .bottom))
                .cornerRadius(12)
                .foregroundStyle(.black)
                .offset(y: -65).sheet(isPresented: $sheetShowed) {
                    PayView(total: cartViewModel.finalTotal)
                }
                
            }
            .scrollContentBackground(.hidden)
        }
    }
}

#Preview {
    MyCartView(cartViewModel: CartViewModel())
}
