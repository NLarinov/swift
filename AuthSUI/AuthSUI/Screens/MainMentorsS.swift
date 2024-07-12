//
//  ContentView.swift
//  SteamGames
//  Created by brfsu on 04.02.2022.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @StateObject private var viewModel = AuthViewModel()
    
    @Environment(\.modelContext)
    private var modelContext
    
    @State var posts: [Post] = []
    @Binding var errorState: ErrorState
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section("Your Mentors") {
                    ForEach(posts) { post in
                        NavigationLink(
                            destination: Text("\(post.text)").padding(20)
                        ) {
                            PostView(post: PostDTO(from: post))
                        }
                        .swipeActions(edge: .leading) {
                            Button("Delete", systemImage: "minus") {
                                withAnimation {
                                    posts.removeAll { $0.title == post.title }
                                    modelContext.insert(PostDTO(from: post))
                                }
                            }
                            .tint(.red)
                        }
                    }
                }
            }
            .navigationTitle("Mentors")
        }
        .onAppear() {
            let completion: (([Post]) -> Void) = { posts in
                for post in posts {
                    print(">>>"+viewModel.univ)
                    if post.univ == viewModel.univ {
                        self.posts.append(post)
                    }
                    self.posts.append(post)
                }
            }
            Posts().loadData(url: "http://localhost:3003/posts/feed", completion: completion)
        }
        Spacer()
        HStack {
            Text("Authorized user. Press to logout").onTapGesture {
                UserDefaults.standard.setValue(false, forKey: "isAuth")
                errorState = .Success(message: "Successfully signed out.")
                dismiss()
            }
        }
        .padding()
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
    }
}

struct PostView: View {
    @State var post: PostDTO

    var body: some View {
        HStack(spacing: 30) {
            VStack(alignment: .leading) {
                Text("\(post.nick)").bold().lineLimit(1).font(.system(size: 25, weight: .bold)).padding(.bottom, 2)
                Text("\(post.univ) / \(post.faculty) / \(post.grade)-year").bold().lineLimit(1).font(.system(size: 15, weight: .light)).padding(.bottom, 10)
                Text("\(post.tags)").foregroundColor(.red).italic().lineLimit(1).font(.system(size: 15, weight: .light))
            }
        }
    }
}
