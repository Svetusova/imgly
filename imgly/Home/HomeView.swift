import Combine
import Foundation
import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    @State private var isDarkMode = false
    
    @EnvironmentObject var sceneDelegate: SceneDelegate
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Img.ly List")
                    .foregroundStyle(Color.primaryText)
                    .font(.system(size: 25))
                    .padding(.top, 30)
                
                ListView(viewModel: ListViewModel(label: "", items: viewModel.items))
                
                Spacer()
                
                Toggle("Dark Theme", isOn: $isDarkMode)
                    .tint(.primaryText)
                    .foregroundColor(.primaryText)
                    .onChange(of: isDarkMode) {
                        if let window = sceneDelegate.window {
                            window.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                        }
                    }
                    .padding(20)
            }
        }
        .onAppear {
            if viewModel.items.isEmpty {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    HomeView()
}
