import Combine
import Foundation

class APIClient {
    static private var path = "https://ubique.img.ly/frontend-tha/"
    
    static func fetchData(_ completion: @escaping ([Item], String?) -> Void) {
        let api = path + "data.json"
        var items: [Item] = []
        var strError = ""
        
        guard let url = URL(string: api) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
               if let data = data {
                    let result = try JSONDecoder().decode([Item].self, from: data)
                    
                        items = result
                    
                }
            } catch (let error) {
                strError = error.localizedDescription
            }
            
            completion(items, strError)
        }.resume()
    }
    
    static func fetchItemDetails(_ id: String, _ completion: @escaping (ItemDetails?, String?) -> Void) {
        let api = path + "entries/\(id).json"
        var item: ItemDetails?
        var strError = ""
        
        guard let url = URL(string: api) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {
               if let data = data {
                    let result = try JSONDecoder().decode(ItemDetails.self, from: data)
                        item = result
                } else {
                    print("No data")
                }
            } catch (let error) {
                strError = error.localizedDescription
            }
            
            completion(item, strError)
        }.resume()
    }
}
