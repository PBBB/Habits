//
//  Activity.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import Foundation
struct Activity: Codable {
    var name: String
    var description: String
    var doneTimes = 0
}

class Activities: ObservableObject {
    
    enum ActivityError: Error {
        case sameNameAlreadyExists
    }
    
    @Published var activities: [Activity] = [
        Activity(name: "Language", description: "Learning English", doneTimes: 0),
        Activity(name: "Instrument", description: "Learning to play piano", doneTimes: 0),
        Activity(name: "Exercising", description: "Slow run", doneTimes: 0)
        ] {
        didSet {
            guard let data = try? JSONEncoder().encode(self.activities) else {
                print("Data encoding failed")
                return
            }
            
            UserDefaults.standard.set(data, forKey: "activities")
        }
    }
    
    func addActivity(activity: Activity) throws {
        let activityNames: [String] = activities.map({ $0.name })
        if activityNames.contains(activity.name) {
            throw ActivityError.sameNameAlreadyExists
        } else {
            activities.append(activity)
        }
    }
    
    func doOneMoreTime(activity activityToAddTime: Activity) {
        guard let index = activities.firstIndex(where: { $0.name == activityToAddTime.name }) else {
            print("No activity found")
            return
        }
        
        activities[index].doneTimes += 1
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "activities") {
            guard let savedActivities = try? JSONDecoder().decode([Activity].self, from: data) else {
                print("Data decoding failed")
                return
            }
            activities = savedActivities
            
        } else {
            return
        }
    }
}
