import XCTest
@testable import imgly

final class imglyTests: XCTestCase {
    var items = [ Item(id: "12345", label: "item1"),
                  Item(id: "12345", label: "item2"),
                  Item(id: "12345", label: "item3"),
                  Item(id: "12345", label: "item4"),
                  Item(id: "12345", label: "item5"),
                  Item(id: "12345", label: "item6") ]
    
    func testListModel() throws {
        let viewModel = ListViewModel(label: "imgly list", items: items)
        
        viewModel.delete(at: IndexSet(integer: viewModel.items.index(after: 3)))
        
        XCTAssertTrue(viewModel.items.count == 5)
        
        viewModel.move(fromOffsets: IndexSet(integer: viewModel.items.index(after: 3)), toOffset: 1)
        
        XCTAssertTrue(viewModel.items[1].label == "item6")
    }
}
