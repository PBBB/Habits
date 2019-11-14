//
//  AddActivityView.swift
//  Habits
//
//  Created by PBB on 2019/11/11.
//  Copyright © 2019 PBB. All rights reserved.
//

import SwiftUI

struct AddActivityView: View {
    var activities: Activities
    @State private var name = ""
    @State private var description = ""
    @State private var showingAlert = false
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                
                Section {
                    Button("Add", action: addActivity)
                        .disabled(name.isEmpty || description.isEmpty)
                }
            }
            .navigationBarTitle("Add An Activity")
            .navigationBarItems(leading: Button("Cancel") {
                self.presentationMode.wrappedValue.dismiss()
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Activity Already Exists"), message: nil, dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func addActivity() {
        let activityToAdd = Activity(name: name, description: description)
        
        do {
            try activities.addActivity(activity: activityToAdd)
            presentationMode.wrappedValue.dismiss()
        } catch _ {
            showingAlert = true
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()

        return AddActivityView(activities: activities)
    }
}
