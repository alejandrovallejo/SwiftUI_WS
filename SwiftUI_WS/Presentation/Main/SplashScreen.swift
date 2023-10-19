//
//  SplashScreen.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var coordinator : MainCoordinator
    
    var body: some View {
        Text("SwiftUI Workshop")
            .onAppear{
                coordinator.setup()
            }
    }
}

#Preview {
    SplashScreen(coordinator: MainCoordinator())
}
