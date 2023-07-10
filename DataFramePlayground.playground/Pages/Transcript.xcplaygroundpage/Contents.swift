import UIKit
import Foundation
import TabularData

// Create path
guard let path = Bundle.main.path(forResource: "Transcript Data", ofType: "csv") else {
    fatalError("Error finding file path for 'Transcript Data.csv'")
}

let fileUrl = URL(filePath: path)

// Change delimiter and read CSV files
let configuration = CSVReadingOptions(delimiter: ";")
var df = try DataFrame(contentsOfCSVFile: fileUrl, options: configuration)

print(df)

// Print column conversation
//print(df["conversation"])
//
//for i in df["conversation"] {
//    print(i ?? "")
//}

// Output is in dataframe format
//print(df["conversation"][1])

// Change all conversation to String and save in array
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
