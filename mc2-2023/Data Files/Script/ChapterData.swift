//
//  ChapterData.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 10/07/23.
//

import Foundation
import TabularData

struct ChapterData {
    var df: DataFrame = DataFrame()
    
    init() {
        df = ChapterData.readCSV()
    }
    
    static func readCSV() -> DataFrame {
        guard let path = Bundle.main.path(forResource: "Chapter Data", ofType: "csv") else {
            fatalError("Error finding file path for 'Chapter Data.csv'")
        }

//        print(path)

        let fileUrl = URL(filePath: path)
//        print(fileUrl)

        let configuration = CSVReadingOptions(delimiter: ";")
        let outDf = try! DataFrame(contentsOfCSVFile: fileUrl, options: configuration)

//        print(outDf)
        
        return outDf
    }
}
