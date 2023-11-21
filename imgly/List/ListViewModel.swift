import Foundation

final class ListViewModel: ObservableObject {
    @Published var label: String
    @Published var items: [Item]
    
    init(label: String, items: [Item]) {
        self.label = label
        self.items = items
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            items.remove(at: index)
        }
    }
    
    func move(fromOffsets: IndexSet, toOffset: Int) {
        items.move(fromOffsets: fromOffsets, toOffset: toOffset)
    }
}
