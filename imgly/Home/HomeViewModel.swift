import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    @Published var items: [Item] = []    
    @Published var error = ""
    
    func fetchData() {
        APIClient.fetchData { items, error in
            DispatchQueue.main.async {
                self.items = items
                self.error = error ?? ""
            }
        }
    }
}
