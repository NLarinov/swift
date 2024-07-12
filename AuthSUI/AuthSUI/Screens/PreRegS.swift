//
//  SignupS.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

struct PreRegS: View
{
    @StateObject private var viewModel = AuthViewModel()
    @Binding var errorState: ErrorState
    
    @State private var password = ""
    @State private var email = ""
    @State private var isPasswordVisible = false
    @State private var authorized = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("New account").bold().padding(.bottom, 20).font(.system(size: 45, weight: .bold))
                TextField("Enter your email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                PasswordTextField("Enter your password", text: $password, isSecure: !isPasswordVisible)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .overlay {
                        HStack {
                            Spacer()
                            Button {
                                isPasswordVisible.toggle()
                            } label: {
                                Image(systemName: isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                                    .foregroundColor(.secondary)
                            }
                            .padding(.trailing, 8)
                        }
                    }

                // Defining registration button
                Button {
                    authorized = true
                    errorState = .Success(message: "You are registered successfully.")
                } label: {
                    Text("Register")
                        .font(.system(size: 25, weight: .bold))
                        .frame(width: 200, height: 50)
                        .background(Color.black)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .overlay {
                            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 0)
                        }
                }
                .padding(.top, 30)
            }
            .navigate(to: SignupS(errorState: $errorState, email: $email, password: $password), when: $authorized)
            .padding(50)
        }
        .onReceive(viewModel.$errorState) { newState in
            if case .Success(_) = errorState {
                if case .None = newState {
                    return
                }
            }
            withAnimation {
                errorState = newState
            }
        }
        .navigationTitle("Sign up")
        .overlay (
            ErrorView(errorState: $errorState)
        )
    }
}
