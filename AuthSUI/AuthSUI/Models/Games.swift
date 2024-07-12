//
//  Games.swift
//  SteamGames
//  Created by brfsu on 04.02.2022.
//  https://apidocs.cheapshark.com
//  GET List of Deals
//  https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15

import Foundation
import SwiftData
//
//struct Game: Codable, Identifiable {
//    let id: UUID = UUID()
//    var title: String
//    var normalPrice: String
//    var salePrice: String
//    var steamRatingPercent: String
//    var thumb: String
//}

struct Post: Codable, Identifiable {
    let id: UUID = UUID()
    var title: String
    var text: String
    var userId: Int
    var nick: String
    var tags: String
    var univ: String
    var faculty: String
    var grade: String
}

@Model
final class PostDTO: Identifiable {
    let id: UUID = UUID()
    var title: String
    var text: String
    var userId: Int
    var nick: String
    var tags: String
    var univ: String
    var faculty: String
    var grade: String

    init(
        title: String,
        text: String,
        userId: Int,
        nick: String,
        tags: String,
        univ: String,
        faculty: String,
        grade: String
    ) {
        self.title = title
        self.text = text
        self.userId = userId
        self.nick = nick
        self.tags = tags
        self.univ = univ
        self.faculty = faculty
        self.grade = grade
    }

    init(from post: Post) {
        self.title = post.title
        self.text = post.text
        self.userId = post.userId
        self.nick = post.nick
        self.tags = post.tags
        self.univ = post.univ
        self.faculty = post.faculty
        self.grade = post.grade
    }
}

class Posts: ObservableObject {
    @Published var posts = [Post]()
    func loadData<T: Decodable>(url: String, completion: @escaping (T) -> ()) {
        guard let url = URL(string: url) else {
            print("The url was invalid!")
            return
        }
        
        var request = URLRequest(url: url)
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            guard
                let data = data
            else {
                print(">>> error")
                return
            }
            
            let posts = try! JSONDecoder().decode(T.self, from: data)
            
            print(posts)
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
