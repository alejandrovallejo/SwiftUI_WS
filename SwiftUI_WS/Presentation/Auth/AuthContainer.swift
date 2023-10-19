//
//  AuthContainer.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

enum AuthState : Int {
    case Login = 0
    case SignUp
}

struct AuthContainer: View {
    @StateObject var coordinator : AuthCoordinator
    
    var body: some View {
        ZStack {
            if coordinator.state == .Login {
                LoginScreen(coordinator: coordinator)
                    .transition(.move(edge: .leading))
            }
            else if coordinator.state == .SignUp {
                SignUpScreen(coordinator: coordinator)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}

#Preview {
    AuthContainer(coordinator: AuthCoordinator())
}
