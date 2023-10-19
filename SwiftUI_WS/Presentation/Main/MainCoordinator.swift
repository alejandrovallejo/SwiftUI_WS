//
//  MainCoordinator.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import Foundation

class MainCoordinator : Coordinator {
    typealias SomeState = MainState
    typealias SomeContainer = MainContainer
    
    @Published var state : SomeState
    var parent : (any Coordinator)?
    
    init(state: SomeState = .NotInitialized,
         parent: (any Coordinator)? = nil) {
        self.state = state
        self.parent = parent
    }
    
    func setup() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.goNext()
        }
    }
    
    func start() -> SomeContainer {
        return SomeContainer(coordinator: self)
    }
    
    func startAuth() -> AuthContainer {
        return AuthCoordinator(parent: self).start()
    }
    
    func startTab() -> TabContainer {
        return TabCoordinator(parent: self).start()
    }

}
