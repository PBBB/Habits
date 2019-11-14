//
//  ContentView.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var activities = Activities()
    @State private var showAddActivityView = false
    
    var body: some View {
        NavigationView {
            List(activities.activities, id: \.name) { activity in
                NavigationLink(destination: ActivityDetailView(activities: self.activities, activity: activity)) {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(activity.name)
                            Text(activity.description)
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                        Spacer()
                        Text("\(activity.doneTimes) times")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    }
                    .padding(.vertical, 4)
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
