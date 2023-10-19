//
//  Coordinator.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import Foundation
import SwiftUI

protocol Coordinator : ObservableObject {
    associatedtype SomeState : RawRepresentable where SomeState.RawValue == Int
    var state : SomeState { get set }
    
    associatedtype SomeContainer : View
    
    var parent : (any Coordinator)? { get set }
    
    func start() -> SomeContainer
    func changeState(newState: SomeState)
    
    func goNext()
    func goBack()
    func goToRoot()
    func goToAppRoot()
    func dismissWith(success: Bool)
}

extension Coordinator {
    func changeState(newState: SomeState) {
        withAnimation {
            state = newState
        }
    }
    
    func goNext() {
        let nextState = SomeState(rawValue: state.rawValue + 1) ?? state
        changeState(newState: nextState)
    }
    func goBack() {
        let nextState = SomeState(rawValue: state.rawValue - 1) ?? state
        changeState(newState: nextState)
    }
    func goToRoot() {
        let nextState = SomeState(rawValue: 0) ?? state
        changeState(newState: nextState)
    }
    func dismissWith(success: Bool){
        goToRoot()
        
        if let parentFlow = parent {
            success ? parentFlow.goNext() : parentFlow.goBack()
        }
    }
    func goToAppRoot() {
        goToRoot()
        
        if let parentFlow = parent {
            parentFlow.goToAppRoot()
        }
    }
}
