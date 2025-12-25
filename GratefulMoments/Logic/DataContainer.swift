//
//  DataContainer.swift
//  GratefulMoments
//
//  Created by Karen Tran on 2025-12-24.
//

import SwiftData
import SwiftUI

@Observable
@MainActor
class DataContainer {
    let modelContainer: ModelContainer
    
    var context: ModelContext {
        modelContainer.mainContext
    }
    
    init(includeSampleMoments: Bool = false) {
        let schema = Schema([
            Moment.self,
        ])
        
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: includeSampleMoments)
        
        do {
            //create the storage
            modelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            if includeSampleMoments {
                loadSampleMoments()
            }
            try context.save()
        } catch {
            fatalError("Could not create ModelContainer \(error)")
        }
    }
    
    private func loadSampleMoments() {
        for moment in Moment.sampleData {
            context.insert(moment)
        }
    }
}

// Sample data
private let sampleContainer = DataContainer(includeSampleMoments: true)

extension View {
    func sampleDataContainer() -> some View {
        self
            .environment(sampleContainer)
            .modelContainer(sampleContainer.modelContainer)
    }
}
