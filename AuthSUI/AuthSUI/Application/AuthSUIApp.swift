//
//  AuthSUI8App.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

@main
struct AuthSUIApp: App
{
    var body: some Scene {
        WindowGroup {
            StartS()
        }
        .modelContainer(for: [PostDTO.self])
    }
}
