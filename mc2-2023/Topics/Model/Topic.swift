//
//  Topic.swift
//  mc2-2023
//
//  Created by Nattfeb on 22/06/23.
//

import SwiftUI

//Model : Topic

struct Topic: Identifiable{
    var id: UUID = .init()
    var imageName: String
    var topicTitle: String
    var difficulty: String
    var tags: [String]
}

var topicList: [Topic] = [
    .init(imageName: "Topic1", topicTitle: "School", difficulty: "Beginner", tags: ["Present Simple", "Past Simple"]),
    .init(imageName: "Topic2", topicTitle: "Bank", difficulty: "Beginner", tags: ["Future Simple"]),
    .init(imageName: "Topic3", topicTitle: "Restaurant", difficulty: "Pre-Intermediate", tags: ["Present Continuous", "Past Continuous"]),
    .init(imageName: "Topic4", topicTitle: "Mall", difficulty: "Pre-Intermediate", tags: ["Present Continuous", "Future Continuous"]),
    .init(imageName: "Topic5", topicTitle: "Bakery", difficulty: "Intermediate", tags: ["Present Perfect", "Past Perfect"]),
    .init(imageName: "Topic6", topicTitle: "Coffee Shop", difficulty: "Intermediate", tags: ["Present Perfect", "Future Perfect"]),
    .init(imageName: "Topic7", topicTitle: "Pharmacy", difficulty: "Upper-Intermediate", tags: ["Passive Voice"]),
    .init(imageName: "Topic8", topicTitle: "Market", difficulty: "Advanced", tags: ["Present Perfect Continuous", "Past Perfect Continuous"]),
    .init(imageName: "Topic9", topicTitle: "Laundry", difficulty: "Mastery", tags: ["Future Perfect Continuous"]),
]
