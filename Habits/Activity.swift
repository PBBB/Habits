//
//  Activity.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import Foundation
struct Activity {
    var name: String
    var description: String
    var doneTimes = 0
}


enum ActivityError: Error {
    case sameNameAlreadyExists
}

class Activities: ObservableObject {
    @Published var activities: [Activity] = [
        Activity(name: "Language", description: "Learning English", doneTimes: 0),
        Activity(name: "Instrument", description: "Learning to play piano", doneTimes: 0),
        Activity(name: "Exercising", description: "Slow run", doneTimes: 0)
    ]
    
    func addActivity(activity: Activity) throws {
        let activityNames: [String] = activities.map({ $0.name })
        if activityNames.contains(activity.name) {
            throw ActivityError.sameNameAlreadyExists
        } else {
            activities.append(activity)
        }
    }
}
