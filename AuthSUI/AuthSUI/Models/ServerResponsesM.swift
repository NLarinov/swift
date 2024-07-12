//
//  RegLogResponse.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import Foundation

struct RegLogResponse: Codable
{
    let id: Int
    let token: String
}


struct RegResponse: Codable {
    let user: User
    let accessToken: String
}

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let surname: String
    let email: String
    let univ: String
}

//     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoic2RmIiwic3VybmFtZSI6InNkZiIsImVtYWlsIjoiYXNkQG1haWwucnUiLCJpZCI6MSwiaWF0IjoxNzIwNTM1MDkyLCJleHAiOjE3MjA1MzU2OTJ9.mdpiCS2lhi01ReVrtn6n2EayPqbQqyqXtxjH0Kt5odc"

struct ErrResponse: Codable
{
    let message: String
}
