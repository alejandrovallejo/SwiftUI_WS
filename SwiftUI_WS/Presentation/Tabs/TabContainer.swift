//
//  TabContainer.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

enum TabState : Int {
    case Home = 0
    case Settings
}


struct TabContainer: View {
    @StateObject var coordinator : TabCoordinator
    
    var body: some View {
        TabView(selection: $coordinator.state) {
            HomeScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(TabState.Home)
                .onTapGesture {
                    coordinator.state = .Home
                }
            SettingsScreen(coordinator: coordinator)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                .tag(TabState.Settings)
                .onTapGesture {
                    coordinator.state = .Settings
                }
        }
    }
}

#Preview {
    TabContainer(coordinator: TabCoordinator())
}
