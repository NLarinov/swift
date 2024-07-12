//
//  MainAuthS.swift
//  AuthSUI8
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

struct MainAuthS: View {
    @State private var errorState: ErrorState = .None
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("UniMentors").bold().padding(.bottom, 50).font(.system(size: 45, weight: .bold))
                signInButtonV()
                signUpButtonV()
                
            }.navigationBarTitle("Auth", displayMode: .inline)
        }
    }
    
    @ViewBuilder func resetPasswordButtonV() -> some View {
        NavigationLink(destination: ResetS(errorState: $errorState)) {
            Text("Reset password")
        }
        .font(.system(size: 15, weight: .bold))
        .frame(width: 120, height: 30).padding()
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
        }
        .opacity(0.7) // Making the button less prominent
    }

    @ViewBuilder func signUpButtonV() -> some View {
        NavigationLink(destination: PreRegS(errorState: $errorState)) {
            Text("Sign up")
        }
        .font(.system(size: 25, weight: .bold))
        .frame(width: 200, height: 50)
        .background(Color.black)
        .foregroundColor(.white)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 0)
        }
    }
    
    @ViewBuilder func signInButtonV() -> some View {
        NavigationLink(destination: SigninS(errorState: $errorState)) {
            Text("Sign in")
        }
        .font(.system(size: 25, weight: .bold))
        .frame(width: 200, height: 50)
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
        }
    }
    

    
    @ViewBuilder func deleteUserAccountButtonV() -> some View {
        NavigationLink(destination: DropS(errorState: $errorState)) {
            Text("Delete account")
        }
        .font(.system(size: 15, weight: .bold))
        .frame(width: 120, height: 30).padding()
        .background(Color.white)
        .foregroundColor(.black)
        .cornerRadius(10)
        .overlay {
            RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 5)
        }
        .opacity(0.7) // Making the button less prominent
    }
}
