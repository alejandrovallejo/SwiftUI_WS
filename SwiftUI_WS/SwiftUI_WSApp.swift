//
//  SwiftUI_WSApp.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 18/10/23.
//

import SwiftUI

@main
struct SwiftUI_WSApp: App {
    @StateObject var coordinator = MainCoordinator()
    
    var body: some Scene {
        WindowGroup {
            coordinator.start()
        }
    }
}

struct TestApp_Previews: PreviewProvider {
    @StateObject static var coordinator = MainCoordinator()
    
    static var previews: some View {
        coordinator.start()
    }
}
