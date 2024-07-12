//
//  SignupS.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

struct SignupS: View
{
    @StateObject private var viewModel = AuthViewModel()
    @Binding var errorState: ErrorState
    @Binding var email: String
    @Binding var password: String
    
    @State private var username = ""
    @State private var secretResponse = ""
    @State private var university = ""
    @State private var faculty = ""
    @State private var grade = ""
    @State private var isPasswordVisible = false
    @State private var authorized = false

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Bio").padding(.bottom, 20).font(.system(size: 35, weight: .medium))
                TextField("Enter your name", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter your surname", text: $secretResponse)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Choose your university", text: $university)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Choose your faculty", text: $faculty)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                TextField("Enter your year (education)", text: $grade)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                // Defining registration button
                Button {
                    let body: [String: Any] = [
                        "name": username,
                        "password": password,
                        "email": email,
                        "surname": secretResponse,
                        "univ": university,
                        "faculty": faculty,
                        "grade": grade
                    ]
                    print(body)
                    viewModel.postRequest(endpoint: "signUp", body: body, callback: { token in
                        if token.count > 0 {
                            print(token)
                            authorized = true
                            errorState = .Success(message: "You are registered successfully.")
                        }
                    })
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
            .navigate(to: ContentView(errorState: $errorState), when: $authorized)
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
        .navigationTitle("Bio")
        .overlay (
            ErrorView(errorState: $errorState)
        )
    }
}
