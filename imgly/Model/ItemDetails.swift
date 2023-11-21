import Foundation

struct ItemDetails: Decodable {
    var id: String
    var createdAt: String
    var createdBy: String
    var lastModifiedAt: String
    var lastModifiedBy: String
    var description: String
    
    init(id: String = "", createdAt: String = "", createdBy: String = "", lastModifiedAt: String = "", lastModifiedBy: String = "", description: String = "") {
        self.id = id
        self.createdAt = createdAt
        self.createdBy = createdBy
        self.lastModifiedAt = lastModifiedAt
        self.lastModifiedBy = lastModifiedBy
        self.description = description
    }
}
