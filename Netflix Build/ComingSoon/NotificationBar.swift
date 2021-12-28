//
//  NotificationBar.swift
//  Netflix Build
//
//  Created by Stanley Pan on 2021/12/28.
//

import SwiftUI

struct NotificationBar: View {
    
    @Binding var showNotificationList: Bool
    
    var body: some View {
        Button(action: {
            // TODO: Show notification list
            showNotificationList = true
        }, label: {
            HStack {
                Image(systemName: "bell")
                
                Text("Notifications")
                    .bold()
                
                Spacer()
                
                Image(systemName: "chevron.right")
            }
            .font(.system(size: 18, weight: .bold))
        })
        .foregroundColor(.white)
        .padding()
    }
}

struct NotificationBar_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            NotificationBar(showNotificationList: .constant(false))
        }
    }
}
