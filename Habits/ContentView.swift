//
//  ContentView.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var activities = Activities()
    @State private var showAddActivityView = false
    
    var body: some View {
        NavigationView {
            List(activities.activityTypes, id: \.name) { activityType in
                NavigationLink(destination: ActivityDetailView(activities: self.activities, activityType: activityType)) {
                    VStack(alignment: .leading) {
                        Text(activityType.name)
                        Text("Done \(self.activities.doneTimesOfActivityType(type: activityType)) times")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationBarTitle("Habits")
            .navigationBarItems(trailing: Button(action: {
                self.showAddActivityView = true
            }){
                Image(systemName: "plus")
                }
            )
                .sheet(isPresented: $showAddActivityView) {
                    AddActivityView(activities: self.activities)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()
        activities.activities.append(Activity(type: .language, doneTime: Date()))
        activities.activities.append(Activity(type: .exercising, doneTime: Date()))
        activities.activities.append(Activity(type: .exercising, doneTime: Date()))
        activities.activities.append(Activity(type: .other(name: "Other 1", description: "Desciption 1"), doneTime: Date()))
        return ContentView(activities: activities)
    }
}
