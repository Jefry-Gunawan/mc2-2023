//
//  Topic.swift
//  mc2-2023
//
//  Created by Nattfeb on 22/06/23.
//

import SwiftUI
import TabularData

//Model : Topic

struct Topic: Identifiable{
    var id: UUID = .init()
    var imageName: String
    var topicName: String
}

//var topicList: [Topic] = [
//    .init(imageName: "Topic1", topicTitle: "School", difficulty: "Beginner", tags: ["Present Simple", "Past Simple"]),
//    .init(imageName: "Topic2", topicTitle: "Bank", difficulty: "Beginner", tags: ["Future Simple"]),
//    .init(imageName: "Topic3", topicTitle: "Restaurant", difficulty: "Pre-Intermediate", tags: ["Present Continuous", "Past Continuous"]),
//    .init(imageName: "Topic4", topicTitle: "Mall", difficulty: "Pre-Intermediate", tags: ["Present Continuous", "Future Continuous"]),
//    .init(imageName: "Topic5", topicTitle: "Bakery", difficulty: "Intermediate", tags: ["Present Perfect", "Past Perfect"]),
//    .init(imageName: "Topic6", topicTitle: "Coffee Shop", difficulty: "Intermediate", tags: ["Present Perfect", "Future Perfect"]),
//    .init(imageName: "Topic7", topicTitle: "Pharmacy", difficulty: "Upper-Intermediate", tags: ["Passive Voice"]),
//    .init(imageName: "Topic8", topicTitle: "Market", difficulty: "Advanced", tags: ["Present Perfect Continuous", "Past Perfect Continuous"]),
//    .init(imageName: "Topic9", topicTitle: "Laundry", difficulty: "Mastery", tags: ["Future Perfect Continuous"]),
//]

let topicData = TopicData()

var topicDf: DataFrame {
    topicData.df
}

var topicList: [Topic] = {
    var topics: [Topic] = []
    
    for row in topicDf.rows {
        if let name = row["name"] as? String {
            let topic = Topic(imageName: name, topicName: name)
            topics.append(topic)
        }
    }
    
    return topics
}()
