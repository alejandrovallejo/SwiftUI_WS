//
//  LoginScreen.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject var coordinator : AuthCoordinator
    
    @State var username = ""
    @State var password = ""
    
    var body: some View {
        
        ScrollView {
            VStack(spacing: 20) {
                Spacer()
                Text("Login")
                    .font(.title)
                Spacer()
                Group {
                    VStack {
                        TextField("Email", text: $username)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.primary)
                            .background(Color(.white))
                            .cornerRadius(10.0)
                    }
                    VStack {
                        SecureField("Password", text: $password)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.primary)
                            .background(Color(.white))
                            .cornerRadius(10.0)
                    }
                    
                }
                .padding(5)
                Spacer()
                Button {
                    coordinator.dismissWith(success: true)
                } label: {
                    Text("LOG IN")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .cornerRadius(50.0)
                }
                Button {
                    coordinator.changeState(newState: .SignUp)
                } label: {
                    HStack {
                        Text("Don't have an account?")
                        Text("Signup")
                            .foregroundColor(.accentColor)
                    }
                    .font(.body)
                }
            }
            .padding()
        }
    }
}

#Preview {
    LoginScreen(coordinator: AuthCoordinator())
}
