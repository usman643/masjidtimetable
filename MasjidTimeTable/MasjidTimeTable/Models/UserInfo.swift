//
//  UserInfo.swift
//  NoBolo
//
//  Created by Mudassar Abbas on 10/2/19.
//  Copyright © 2019 Muneeb. All rights reserved.
//

import Foundation


struct UserInfo : Codable {
    let userID : Int?
    let email : String?
    let deviceModel : String?
    let deviceOSVersion : String?
    let timeZone : String?
    let deviceUTCOffset : Int?
    let appVersion : String?
    let deviceType : String?
    let deviceLanguage : String?
    let deviceToken : String?
    let deviceLat : Double?
    let deviceLong : Double?
    let thumbnailURL : String?
    let imageURL : String?
    let termsAndCondition : String?
    let privacyURL : String?
    let appStoreURL : String?
    let rateAppURL : String?
    let notificationCount : Int?
    let notification : Int?
    var termsAccepted : Bool?

    enum CodingKeys: String, CodingKey {

        case userID = "UserID"
        case email = "Email"
        case deviceModel = "DeviceModel"
        case deviceOSVersion = "DeviceOSVersion"
        case timeZone = "TimeZone"
        case deviceUTCOffset = "DeviceUTCOffset"
        case appVersion = "AppVersion"
        case deviceType = "DeviceType"
        case deviceLanguage = "DeviceLanguage"
        case deviceToken = "DeviceToken"
        case deviceLat = "DeviceLat"
        case deviceLong = "DeviceLong"
        case thumbnailURL = "ThumbnailURL"
        case imageURL = "ImageURL"
        case termsAndCondition = "TermsAndCondition"
        case privacyURL = "PrivacyURL"
        case appStoreURL = "AppStoreURL"
        case rateAppURL = "RateAppURL"
        case notificationCount = "NotificationCount"
        case notification = "Notification"
        case termsAccepted = "TermsAccepted"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userID = try values.decodeIfPresent(Int.self, forKey: .userID)
        email = try values.decodeIfPresent(String.self, forKey: .email)
        deviceModel = try values.decodeIfPresent(String.self, forKey: .deviceModel)
        deviceOSVersion = try values.decodeIfPresent(String.self, forKey: .deviceOSVersion)
        timeZone = try values.decodeIfPresent(String.self, forKey: .timeZone)
        deviceUTCOffset = try values.decodeIfPresent(Int.self, forKey: .deviceUTCOffset)
        appVersion = try values.decodeIfPresent(String.self, forKey: .appVersion)
        deviceType = try values.decodeIfPresent(String.self, forKey: .deviceType)
        deviceLanguage = try values.decodeIfPresent(String.self, forKey: .deviceLanguage)
        deviceToken = try values.decodeIfPresent(String.self, forKey: .deviceToken)
        deviceLat = try values.decodeIfPresent(Double.self, forKey: .deviceLat)
        deviceLong = try values.decodeIfPresent(Double.self, forKey: .deviceLong)
        thumbnailURL = try values.decodeIfPresent(String.self, forKey: .thumbnailURL)
        imageURL = try values.decodeIfPresent(String.self, forKey: .imageURL)
        termsAndCondition = try values.decodeIfPresent(String.self, forKey: .termsAndCondition)
        privacyURL = try values.decodeIfPresent(String.self, forKey: .privacyURL)
        appStoreURL = try values.decodeIfPresent(String.self, forKey: .appStoreURL)
        rateAppURL = try values.decodeIfPresent(String.self, forKey: .rateAppURL)
        notificationCount = try values.decodeIfPresent(Int.self, forKey: .notificationCount)
        notification = try values.decodeIfPresent(Int.self, forKey: .notification)
        termsAccepted = try values.decodeIfPresent(Bool.self, forKey: .termsAccepted)
    }

}
