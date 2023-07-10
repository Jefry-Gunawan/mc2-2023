//
//  QuizData.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 10/07/23.
//

import Foundation
import TabularData

struct QuizData {
    var df: DataFrame = DataFrame()
    
    init() {
        df = QuizData.readCSV()
    }
    
    static func readCSV() -> DataFrame {
        guard let path = Bundle.main.path(forResource: "Quiz Data", ofType: "csv") else {
            fatalError("Error finding file path for 'Quiz Data.csv'")
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
