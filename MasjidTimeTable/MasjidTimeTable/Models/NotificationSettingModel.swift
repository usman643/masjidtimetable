

import Foundation
struct NotificationSettingModel : Codable {
	let userID : Int?
	let settingKey : String?
	let settingValue : Bool?
	let recordStatus : String?

	enum CodingKeys: String, CodingKey {

		case userID = "UserID"
		case settingKey = "SettingKey"
		case settingValue = "SettingValue"
		case recordStatus = "RecordStatus"
	}

}
