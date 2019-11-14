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
    var activity: Activity
//    var index: Int
    
    var body: some View {
        Form {
            
            Section {
                Text(activity.description)
                Text("Done \(activity.doneTimes) times")
            }
            
            
            Section {
                Button("Do it") {
                    self.activities.doOneMoreTime(activity: self.activity)
                }
            }
            
            
            
        }
        .navigationBarTitle(Text(activity.name), displayMode: .inline)
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activities: Activities(), activity: Activity(name: "name", description: "description", doneTimes: 1))
    }
}
