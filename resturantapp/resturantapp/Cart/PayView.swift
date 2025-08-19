
import SwiftUI

struct PayView: View {
    @State var message: String = "Pay"
    var total: Double
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.cyan, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            VStack {
                Text("Total: $\(total, specifier: "%.2f")")
                    .foregroundStyle(.white)
                    .font(.title2)
                    .padding(.bottom, 100)
                
                Text("Double tap to pay").foregroundStyle(.white).font(.title2).offset(y: -105)
                
                Text(message)
                    .foregroundStyle(.white)
                    .font(.title2)
                    .frame(width: 140, height: 60)
                    .background(.black)
                    .cornerRadius(15).offset(y: -85)
                    .onTapGesture(count: 2) {
                    if total == 0.00 {
                        message = "No items in cart"
                    } else {
                        message = "Purchase Complete"
                    }
                }
            }
        }
    }
}

#Preview {
    PayView(total: 0.5)
}
