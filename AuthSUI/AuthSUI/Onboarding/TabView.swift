//
//  TabView.swift
//  AuthSUI
//
//  Created by Николай Ткачев on 7/12/24.
//

import SwiftUI

struct Content: View {
    @State private var currentTab = 0
    @State private var authr = false

    var body: some View {
        TabView(selection: $currentTab,
                content:  {
                    ForEach(OnboardingData.list) { viewData in
                        OnboardingView(data: viewData, auth: $authr)
                            .tag(viewData.id)
                    }
                })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigate(to: MainAuthS(), when: $authr)
    }
}
