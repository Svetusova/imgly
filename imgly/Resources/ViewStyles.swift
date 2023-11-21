import SwiftUI

extension View {
    func backButtonStyle(dismissView: @escaping () -> Void) -> some View {
        self.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: dismissView, label: {
                        Image("back")
                            .resizable()
                            .frame(width: 12, height: 20)
                            .aspectRatio(contentMode: .fit)
                            .tint(Color.primaryText)
                    })
                }
         }
    }
    
    func textViewStyle() -> some View {
        self.foregroundColor(.primaryText)
            .font(.system(size: 10))
    }
}
