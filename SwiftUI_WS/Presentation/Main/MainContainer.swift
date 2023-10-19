//
//  MainContainer.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

enum MainState : Int {
    case NotInitialized = 0
    case Unauthorized
    case SessionActive
}

struct MainContainer: View {
    @StateObject var coordinator : MainCoordinator
    
    var body: some View {
        ZStack {
            if coordinator.state == .NotInitialized {
                SplashScreen(coordinator: coordinator)
            }
            else if coordinator.state == .Unauthorized {
                coordinator.startAuth()
                    .transition(.move(edge: .bottom))
            }
            else if coordinator.state == .SessionActive {
                coordinator.startTab()
            }
        }
    }
}

#Preview {
    MainContainer(coordinator: MainCoordinator())
}
