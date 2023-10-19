//
//  SignUpScreen.swift
//  SwiftUI_WS
//
//  Created by Alejandro Matias Vallejo on 19/10/23.
//

import SwiftUI

struct SignUpScreen: View {
    @StateObject var coordinator : AuthCoordinator
    @State private var shouldShowImagePicker = false
    
    @State var username = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    @State var usernameErrorMessage = "Invalid username"
    @State var passwordErrorMessage = "Invalid password"
    @State var lastStatusMessage = ""
    
    @State var fullname = ""
    @State var nickname = ""
    @State var isValidUser = false
    @State var image : UIImage?
    
    @State var isButtonEnabled = false
    @State var isUsernameFieldValid = true
    @State var isPasswordFieldValid = true
    
    
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                Text("Create Account")
                    .font(.title)
                Spacer()
                Button {
                    shouldShowImagePicker.toggle()
                } label: {
                    VStack{
                        if let image = image{
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 128, height: 128)
                                .cornerRadius(64)
                        }
                        else {
                            Image(systemName: "person.fill")
                                .font(.system(size: 64))
                                .padding()
                        }
                    }
                }
                .overlay(RoundedRectangle(cornerRadius: 64)
                    .stroke(.blue, lineWidth: 3))
                
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
                        if !isUsernameFieldValid {
                            Text(usernameErrorMessage)
                                .foregroundColor(.red)
                        }
                    }
                    TextField("Nickname", text: $nickname)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding()
                        .font(.title3)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.primary)
                        .background(Color(.white))
                        .cornerRadius(10.0)
                    
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
                        if !isPasswordFieldValid {
                            Text(usernameErrorMessage)
                                .foregroundColor(.red)
                        }
                    }
                    VStack {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding()
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.primary)
                            .background(Color(.white))
                            .cornerRadius(10.0)
                        if !isPasswordFieldValid {
                            Text(usernameErrorMessage)
                                .foregroundColor(.red)
                        }
                    }
                    
                    
                }.padding(5)
                
                Spacer()
                
                Button {
                    coordinator.dismissWith(success: false)
                } label: {
                    Text("Create Account")
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding(.vertical, 5)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(.blue))
                        .cornerRadius(50.0)
                }
                .font(.system(size: 14, weight: .semibold))
                Spacer()
                Button {
                    coordinator.goBack()
                } label: {
                    Text ("Dismiss")
                        .font(.title3)
                }
                
                
                Text(lastStatusMessage)
                    .foregroundColor(.red)
            }
            .padding()
        }
        .fullScreenCover(isPresented: $shouldShowImagePicker, onDismiss: nil) {
            
        }
    }
}


#Preview {
    SignUpScreen(coordinator: AuthCoordinator())
}
