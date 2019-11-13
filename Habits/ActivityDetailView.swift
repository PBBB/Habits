//
//  ActivityDetailView.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity: Activity
    
    var body: some View {
        NavigationView {
            Form {
                
                Section {
                    Text(activity.description)
                    Text("Done \(activity.doneTimes) times")
                }
                
                Section {
                    Button("Do it") {
//                        self.activity.doneTimes += 1
                    }
                }
                
                
                
            }
            .navigationBarTitle(activity.name)
        }
    }
}

struct ActivityDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityDetailView(activity: Activity(name: "name", description: "description", doneTimes: 1))
    }
}
