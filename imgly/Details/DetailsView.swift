import SwiftUI

struct DetailsView: View {
    @StateObject var viewModel: DetailsViewModel = DetailsViewModel()
    var itemId: String
    var label: String
    
    @Environment(\.dismiss) private var dismiss
    
    init(itemId: String, label: String) {
        self.itemId = itemId
        self.label = label
    }
    
    var body: some View {
        VStack(spacing: 10) {
            if let itemDetails = viewModel.itemDetails {
                Spacer(minLength: 10)
                
                Text(itemDetails.description)
                    .foregroundStyle(Color.primaryText)
                
                HStack {
                    Text("Created by \(itemDetails.createdBy) at \(itemDetails.createdAt.dateFormat())")
                        .textViewStyle ()
                    
                    Spacer()
                }
                
                HStack {
                    Text("Modified by \(itemDetails.lastModifiedBy) at \(itemDetails.lastModifiedAt.dateFormat())")
                        .textViewStyle()
                    
                    Spacer()
                }
                                
                Spacer()
            } else {
                Text(viewModel.error)
                    .foregroundStyle(Color.primaryText)
            }
        }
        .padding([.leading, .trailing], 20)
        .padding(.bottom, 0)
        .onAppear {
            viewModel.fetchItemDetails(itemId)
        }
        .backButtonStyle {
            dismiss()
        }
        .navigationTitle(label)
    }
}

