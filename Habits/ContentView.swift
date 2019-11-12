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
            List(activities.activities, id: \.name) { activity in
                NavigationLink(destination: ActivityDetailView(activity: activity)) {
                    VStack(alignment: .leading) {
                        Text(activity.name)
                        Text("Done \(activity.doneTimes) times")
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
        activities.activities.append(Activity(name: "name1", description: "description1", doneTimes: 1))
        return ContentView(activities: activities)
    }
}
