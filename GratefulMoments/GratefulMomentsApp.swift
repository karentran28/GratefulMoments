//
//  GratefulMomentsApp.swift
//  GratefulMoments
//
//  Created by Karen Tran on 2025-12-24.
//

import SwiftUI
import SwiftData

@main
struct GratefulMomentsApp: App {
    let dataContainer = DataContainer()
    var body: some Scene {
        WindowGroup {
            ContentView()
            // any view can access, dont need to be passed
                .environment(dataContainer)
        }
        // belongs to the scene, not just one view
        .modelContainer(dataContainer.modelContainer)
    }
}
