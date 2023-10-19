//
//  SettingsScreen.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject var coordinator : TabCoordinator
    
    @State var shouldShowLogOutOptions = false
    
    var body: some View {
        VStack(spacing: 30){
            Spacer()
            Text("Settings")
            Button {
                shouldShowLogOutOptions.toggle()
            } label: {
                HStack{
                    Image(systemName: "door.right.hand.open")
                    Text("Log out")
                        .font(.system(size: 24, weight: .bold))
                }
            }
            Spacer()
        }
        .actionSheet(isPresented: $shouldShowLogOutOptions) {
            .init(title: Text("Settings"),
                  message: Text("What do you want to do?"),
                  buttons: [
                    .destructive(Text("Sign Out"), action: {
                        coordinator.goToAppRoot()
                    }),
                    .cancel()
                  ])
        }
    }
}

#Preview {
    SettingsScreen(coordinator: TabCoordinator())
}
