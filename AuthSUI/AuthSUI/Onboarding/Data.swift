//
//  Data.swift
//  AuthSUI
//
//  Created by Николай Ткачев on 7/12/24.
//

import Foundation

struct OnboardingData: Hashable, Identifiable {
    let id: Int
    let backgroundImage: String
    let objectImage: String
    let primaryText: String
    let secondaryText: String

    static let list: [OnboardingData] = [
        OnboardingData(id: 0, backgroundImage: "onboarding-bg-1", objectImage: "onboarding-object-1", primaryText: "Welcome to UniMentors!", secondaryText: "Here you can find a mentor from your own university"),
        OnboardingData(id: 1, backgroundImage: "onboarding-bg-2", objectImage: "onboarding-object-2", primaryText: "Personalization", secondaryText: "We show mentors in presize faculty"),
        OnboardingData(id: 2, backgroundImage: "onboarding-bg-3", objectImage: "onboarding-object-3", primaryText: "Easy to find", secondaryText: "We use filters to specify results")
    ]
}
