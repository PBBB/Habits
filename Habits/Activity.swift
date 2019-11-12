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
    var doneTimes = 1
}


enum ActivityError: Error {
    case sameNameAlreadyExists
}

class Activities: ObservableObject {
    @Published var activities: [Activity] = []
    
    func addActivity(activity: Activity) throws {
        let activityNames: [String] = activities.map({ $0.name })
        if activityNames.contains(activity.name) {
            throw ActivityError.sameNameAlreadyExists
        } else {
            activities.append(activity)
        }
    }
}
