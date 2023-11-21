import Combine
import Foundation

final class DetailsViewModel: ObservableObject {
    @Published var itemDetails: ItemDetails?
    @Published var error = ""
    
    func fetchItemDetails(_ id: String) {
        APIClient.fetchItemDetails(id) { itemDetails, error in
            DispatchQueue.main.async {
                self.itemDetails = itemDetails
                self.error = error ?? ""
            }
        }
    }
}
