//
//  NewsModel.swift
//  Assignment19
//
//  Created by MacBook on 30.10.24.
//

import Foundation

struct NewsData: Codable {
    var news: [NewsModel]?
}

struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

struct Article: Codable {
    var source: Source?
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
}

struct Source: Codable {
    var id: String?
    var name: String?
}

