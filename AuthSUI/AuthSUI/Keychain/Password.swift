//
//  Password.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import Foundation

// Keys for keychain to save bearer token
let account = "su.brf.apps.AuthSUI"

struct BearerToken: Codable {
    let bearerToken: String
}
