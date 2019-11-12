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
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
        let activities = Activities()

        return AddActivityView(activities: activities)
    }
}
