//
//  Idea.swift
//  BirlaCarbon
//
//  Created by Amir Khan on 10/02/2020.
//  Copyright © 2020 Mudassir. All rights reserved.
//

import Foundation

struct Idea : Codable {
    
    let rowIndex : Int?
    var ideaID : Int?
    let hypeIdeaID : String?
    let titile : String?
    let description : String?
    let totalComments : Int?
    let totalLikes : Int?
    var status : String?
    let thumbnailURL : String?
    let imageURL : String?
    let timeAgo : String?
    
    enum CodingKeys: String, CodingKey {
        
        case rowIndex = "RowIndex"
        case ideaID = "IdeaID"
        case hypeIdeaID = "HyperIdeaID"
        case titile = "Titile"
        case description = "Description"
        case totalComments = "TotalComments"
        case totalLikes = "TotalLikes"
        case status = "Status"
        case thumbnailURL = "ThumbnailURL"
        case imageURL = "ImageURL"
        case timeAgo = "TimeAgo"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rowIndex = try values.decodeIfPresent(Int.self, forKey: .rowIndex)
        let idString = try? values.decode(String.self, forKey: .ideaID)
        let idInt = try? values.decode(Int.self, forKey: .ideaID)
        self.ideaID = idInt ?? Int(idString ?? "0")
        hypeIdeaID = try values.decodeIfPresent(String.self, forKey: .hypeIdeaID)
        titile = try values.decodeIfPresent(String.self, forKey: .titile)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        totalComments = try values.decodeIfPresent(Int.self, forKey: .totalComments)
        totalLikes = try values.decodeIfPresent(Int.self, forKey: .totalLikes)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        thumbnailURL = try values.decodeIfPresent(String.self, forKey: .thumbnailURL)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        timeAgo = try values.decodeIfPresent(String.self, forKey: .timeAgo)
    }
}
