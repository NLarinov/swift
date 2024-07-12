//
//  ViewExt.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

extension View {
    /// Navigate to a new view.
    /// - Parameters:
    ///   - view: View to navigate to.
    ///   - binding: Only navigates when this condition is `true`.
    func navigate<NewView: View>(to view: NewView, when binding: Binding<Bool>) -> some View {
        NavigationView {
            ZStack {
                self
                    .navigationBarTitle("")
                    .navigationBarHidden(false)

                NavigationLink(
                    destination: view
                        .navigationBarTitle("")
                        .navigationBarHidden(true),
                    isActive: binding
                ) {
                    EmptyView()
                }
                
                //NavigationLink(value:label:)
                //navigationDestination(isPresented:destination:)
                // inside a NavigationStack or NavigationSplitView
            }
        }
        .navigationViewStyle(.stack)
        .navigationDestination(isPresented: binding) {
            view
                .navigationBarTitle("")
                .navigationBarHidden(true)
            EmptyView()
        }
    }
}
