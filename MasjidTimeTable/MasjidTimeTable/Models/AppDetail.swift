//
//  AppDetail.swift
//  NoBolo
//
//  Created by Muneeb on 4/24/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation


struct AppDetail : Codable {
    let appId : Int?
    let categoryId : Int?
    var title : String?
    var description : String?
    let icon : String?
    let banner : String?
    let yammer : String?
    let referencefile : String?
    let market : [String]?
    let type : String?
    let feedback : [String]?
    let relatedApps : RelatedApps?
    
    enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case categoryId = "category_id"
        case title = "title"
        case description = "description"
        case icon = "icon"
        case banner = "banner"
        case yammer = "yammer"
        case referencefile = "referencefile"
        case market = "market"
        case type = "type"
        case feedback = "feedback"
        case relatedApps = "relatedApps"
    }
    
}

struct RelatedApps : Codable {
    let meta : Meta?
    let content : [Content]?
    
    enum CodingKeys: String, CodingKey {
        case meta = "meta"
        case content = "content"
    }
}

struct Meta : Codable {
    let nextPage : String?
    
    enum CodingKeys: String, CodingKey {
        case nextPage = "nextpage"
    }
}

struct Content : Codable {
    let appId : Int?
    let category : String?
    let title : String?
    let icon : String?
    let context : String?
    let tags : String?
    let status : String?
    
    enum CodingKeys: String, CodingKey {
        case appId = "app_id"
        case category = "category"
        case title = "title"
        case icon = "icon"
        case context = "context"
        case tags = "tags"
        case status = "status"
    }
}
