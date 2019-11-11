//
//  Activity.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import Foundation
struct Activity: Identifiable {
    var id = UUID()
    var type: ActivityType
    var doneTime: Date
}

enum ActivityType: Hashable {
    case language
    case instrument
    case exercising
    case other(name: String, description: String)
    
    var name: String {
        switch self {
        case .exercising:
            return "Exercising"
        case .language:
            return "Language"
        case .instrument:
            return "Instrument"
        case .other(let name, _):
            return name
        }
    }
    
    var description: String {
        switch self {
        case .exercising:
            return "Slow run"
        case .language:
            return "Learning English"
        case .instrument:
            return "Learning to play piano"
        case .other(_, let description):
            return description
        }
    }
}

enum ActivityError: Error {
    case sameTypeNameAlreadyExists
}

class Activities: ObservableObject {
    @Published var activities: [Activity] = []
    
    func addActivity(activity: Activity) throws {
        if self.activityTypes.contains(where: { $0.name == activity.type.name && $0.description != activity.type.description }) {
            throw ActivityError.sameTypeNameAlreadyExists
        } else {
            activities.append(activity)
        }
    }
    
    var activityTypes: Array<ActivityType> {
        var activityTypesSet = Set<ActivityType>()
        for activity in activities {
            activityTypesSet.insert(activity.type)
        }
        let array = Array(activityTypesSet)
        return array
    }
    
    func doneTimesOfActivityType(type: ActivityType) -> Int {
        var times = 0
        for activity in activities {
            if activity.type.name == type.name {
                times += 1
            }
        }
        return times
    }
    
}
