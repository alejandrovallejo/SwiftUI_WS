//
//  AuthCoordinator.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import Foundation


class AuthCoordinator : Coordinator {
    typealias SomeState = AuthState
    typealias SomeContainer = AuthContainer
    
    @Published var state : SomeState
    var parent : (any Coordinator)?
    
    init(state: SomeState = .Login,
         parent: (any Coordinator)? = nil) {
        self.state = state
        self.parent = parent
    }
    
    func start() -> SomeContainer {
        return SomeContainer(coordinator: self)
    }

}
