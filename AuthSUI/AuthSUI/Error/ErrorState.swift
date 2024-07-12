//
//  ErrorState.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import Foundation

enum ErrorState
{
    case Error(message: String)
    case Success(message: String)
    case None // no error state
}
