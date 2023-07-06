//
//  mc2_2023App.swift
//  mc2-2023
//
//  Created by Jefry Gunawan on 21/06/23.
//

import SwiftUI

@main
struct mc2_2023App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            QuizView()
//            SummaryView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
