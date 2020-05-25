//
//  APIPath.swift
//  NoBolo
//
//  Created by Muneeb on 4/24/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation

enum APIPath:String {
    //URLs will be added here
//    case baseUrl = "http://staging3.sdsol.com/BirlaCarbon/api/"
    case baseUrl = "https://birlacarbon.sdsol.com/api/"
    case getNotifications = "v1/Users/GetNotifications"
    case createObject = "objects"
    case uploadObjectImg = "objects/1348d5af9d42c7ba830725054f339e7f/192.168.10.64:821267793546005"
    case userSignIn = "v1/Users/Signin"
    case getNotificationSettings = "v1/Users/GetNotificationSettings"
    case updateNotificationSetting = "v1/Users/UpdateUserSetting"
    case createIDea = "v1/Idea/CreateIdea"
    case uploadImageOFIdea = "v1/Idea/UploadIdeaMainImage"
    case getUserIdeas = "v1/Users/GetUserIdeas"
    case acceptTermsAndConditions = "v1/Users/AcceptTAC/"
    case getUserIdea = "v1/Idea/GetIdeaByID"
    case uploadIdeaMedia = "v1/Idea/UploadIdeaMedia"
    case updateIdea = "v1/Idea/UpdateIdea"
    
    case getIdeaByIdV2 = "v1/Idea/GetIdeaByID_V3"
    case deleteAttachmentById = "v1/Idea/DeleteAttachment/"
    case deleteIdea = "v1/Idea/DeleteIdea/"
    
    case getSetting = "v1/Users/GetSSOSetting"
}
