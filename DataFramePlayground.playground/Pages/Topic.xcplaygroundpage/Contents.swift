import UIKit
import Foundation
import TabularData

guard let path = Bundle.main.path(forResource: "Topic Data", ofType: "csv") else {
    fatalError("Error finding file path for 'Topic Data.csv'")
}

print(path)

let fileUrl = URL(filePath: path)
print(fileUrl)

//guard let fileUrl = URL(filePath: path) else {
//    fatalError("Error creating URL from file path: \(path)")
//}

let configuration = CSVReadingOptions(delimiter: ";")
var df = try DataFrame(contentsOfCSVFile: fileUrl, options: configuration)

print(df)

//print(df["conversation"])
//
//for i in df["conversation"] {
//    print(i ?? "")
//}

//print(df["conversation"][1])

//var conversationArray: [String] = []
//
//for i in df["conversation"] {
//    conversationArray.append(i as! String)
//}
//
//for i in 0...3 {
//    print(conversationArray[i])
//}

// Filter column "id"
//let filtered = df.filter(on: "name", String.self, {$0 == "Ashlie" || $0 == "Stephen"})
//print(filtered)
