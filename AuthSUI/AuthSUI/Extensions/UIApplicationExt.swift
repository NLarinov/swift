//
//  UIApplicationExt.swift
//  AuthSUI
//  Created by brfsu on 10.07.2024.
//
import SwiftUI

extension UIApplication
{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
