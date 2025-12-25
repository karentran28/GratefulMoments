//
//  Moments.swift
//  GratefulMoments
//
//  Created by Karen Tran on 2025-12-24.
//

import Foundation
import SwiftData
import UIKit

//Data can be persisted by SwiftData. UIImage cannot be stored directly
@Model
class Moment {
    var title: String
    var note: String
    var imageData: Data? //stores raw image bytes
    var timeStamp: Date
    
    init(title: String, note: String, imageData: Data? = nil, timeStamp: Date = .now) {
        self.title = title
        self.note = note
        self.imageData = imageData
        self.timeStamp = timeStamp
    }
    
    //computed property
    //converts stored Data -> UIImage
    var image: UIImage? {
        if let data = imageData {
            return UIImage(data: data)
        }
        return nil
    }
}

extension Moment {
    static let sample = sampleData[0]
    static let longTextSample = sampleData[1]
    static let imageSample = sampleData[4]
    
    static let sampleData = [
        Moment(title: "title1", note: "picked my first tomato"),
        Moment(title: "Passed the test", note: "The chem exam was tough, but I think I did well 🙌 I’m so glad I reached out to Guillermo and Lee for a study session. It really helped!", imageData: UIImage(named: "Study")?.pngData()),
        Moment(title: "down time", note: "so grateful for a relaxing evening", imageData: UIImage(named: "Relax")?.pngData()),
        Moment(title: "Family", note: ""),
        Moment(title: "Rock on", note: "Went to an amazing concert last night", imageData: UIImage(named: "Concert")?.pngData())
    ]
}
