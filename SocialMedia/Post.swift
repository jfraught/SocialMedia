//
//  Post.swift
//  SocialMedia
//
//  Created by Jordan Fraughton on 3/26/24.
//

import Foundation

struct Post: Equatable {
    var title: String
    var bodyText: String
    var date: Date
    var user: String
    var comments: [String]
    var id = UUID()

    static var samplePosts: [Post] { [
        Post(title: "Post One", bodyText: "he order of the arrangedSubviews array defines the order in which views appear in the stack. For horizontal stacks, the views are laid out in reading order, with the lower index views appearing before the higher index views. In English, for example, the views are laid out in order from left to right. For vertical stacks, the views are laid out from top to bottom, with the lower index views above the higher index views.", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Two", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Three", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Four", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Five", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Six", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Seven", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Eight", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post Nine", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"]),
        Post(title: "Post 10", bodyText: "Sample Text", date: Date(), user: "Jordan", comments: ["Nice!", "Lame", "Cool"])
        ]
    }

    static func ==(lhs: Post, rhs: Post) -> Bool {
        lhs.id == rhs.id
    }
}
