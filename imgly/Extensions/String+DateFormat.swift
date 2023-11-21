import Foundation

extension String {
    func dateFormat() -> String {
        var formattedDateString = ""

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: self) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "HH:mm:ss, MMM d, yyyy"
            formattedDateString = outputDateFormatter.string(from: date)
        }
        
        return formattedDateString
    }
}
