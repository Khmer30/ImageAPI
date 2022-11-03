//
//  ImageAPI.swift
//  ImageAPI


import Foundation

enum ResponseError : Error {
    case invalidImageData
}

struct ImageAPIRequest: Codable {
    let albumID: Int
    let id: Int
    let title: String
    var url: String
    let thumbnailURL: String
    
    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id
        case title
        case url
        case thumbnailURL = "thumbnailUrl"
    }
}
