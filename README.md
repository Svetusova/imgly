# Imgly Test

Two screenshots of the first screen showcasing both light and dark themes:

<p align="row">
<img src= "https://github.com/Svetusova/imgly/assets/12214537/faa618de-1b1d-49e9-b142-cdde8bc8e800" width="300" hspace="50">
<img src= "https://github.com/Svetusova/imgly/assets/12214537/3720c42c-b912-49a0-99b2-8be6b710334b" width="300" hspace="20">
</p>

This test assignment involves the utilization of the MVVM architecture, incorporating Combine and SwiftUI.

## Requirements

###  1. Fetch and display the data

All data is retrieved at the network level in the ```APIClient.swift```:

```swift
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
```

and the function is called in the ```HomeViewModel.swift```:

```swift
func fetchData() {
    APIClient.fetchData { items, error in
        DispatchQueue.main.async {
            self.items = items
            self.error = error ?? ""
        }
    }
}
```
###  2. Interact with the data

The implementation of the interaction is only deleting and moving items visually:

```swift
.onDelete { indexSet in
    viewModel.delete(at: indexSet)
}
.onMove { indexSet, index in
    viewModel.move(fromOffsets: indexSet, toOffset: index)
}
```
 
###  3. Fetch additional data

The same like for fetching imgly items but passing the ```id``` if it exists to present item details: 

```swift
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
```

###  4. Add theming

Adding the toggle button on the ```HomeView.swift``` to switch between light and dark themes.

###  5. Polish the design

Added two custom main colors for the text and background. These colors are just switched to show contrast for both themes. Also added style for a back button used in several List View screens. 

## Deliverables

This test took longer than anticipated, prompting me to complete it thoroughly locally before uploading it to GitHub. I consistently adhere to code style rules, ensuring that even a small test project is readable with well-chosen, concise function names. I meticulously organize all levels of the architecture by creating appropriate folders and classes, exemplifying a structured approach to code organization. 



