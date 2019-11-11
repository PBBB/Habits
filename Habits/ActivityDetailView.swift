//
//  ActivityDetailView.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    var activities: Activities
    var activityType: ActivityType
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        activities.activities.append(Activity(type: .language, doneTime: Date()))
        return ActivityDetailView(activities: activities, activityType: .language)
    }
}
