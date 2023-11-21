import Foundation
import SwiftUI

struct SubListView: View {
    var label: String
    var items: [Item]
    
    @Environment(\.dismiss) private var dismiss
    
    init(label: String, items: [Item]) {
        self.label = label
        self.items = items
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer(minLength: 100)
                
                ListView(viewModel: ListViewModel(label: label, items: items))
            }
        }
        .navigationTitle(label)
        .backButtonStyle {
            dismiss()
        }
    }
}

struct ListView: View {
    @ObservedObject var viewModel: ListViewModel
    
    init(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.label) { item in
                NavigationLink {
                    if let itemId = item.id {
                        DetailsView(itemId: itemId, label: item.label)
                    } else {
                        SubListView(label: item.label, items: item.children ?? [])
                    }
                } label: {
                    Text(item.label)
                        .foregroundStyle(Color.primaryText)
                }
            }
            .onDelete { indexSet in
                viewModel.delete(at: indexSet)
            }
            .onMove { indexSet, index in
                viewModel.move(fromOffsets: indexSet, toOffset: index)
            }
        }
        .listRowSeparator(.hidden)
        .environment(\.defaultMinListRowHeight, 50)
    }
}
