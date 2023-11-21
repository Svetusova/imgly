import Foundation

struct Item: Decodable, Identifiable {
    var id: String?
    var label: String
    var children: [Item]?
    
    init(id: String? = nil, label: String = "", children: [Item]? = nil) {
        self.id = id
        self.label = label
        self.children = children
    }
}
