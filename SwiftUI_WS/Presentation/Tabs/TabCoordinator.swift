//
//  TabCoordinator.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import Foundation


class TabCoordinator : Coordinator {
    typealias SomeState = TabState
    typealias SomeContainer = TabContainer
    
    @Published var state : SomeState
    var parent : (any Coordinator)?
    
    init(state: SomeState = .Home,
         parent: (any Coordinator)? = nil) {
        self.state = state
        self.parent = parent
    }
    
    func start() -> SomeContainer {
        return SomeContainer(coordinator: self)
    }

}
