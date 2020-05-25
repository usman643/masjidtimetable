

import Foundation
struct NotificationModel : Codable {
	let rowIndex : Int?
	let entityID : Int?
	let userNotificationID : Int?
	let message : String?
	let isViewed : Bool?
	let timeAgo : String?
	let notificationType : String?
	let ideaTitle : String?

	enum CodingKeys: String, CodingKey {

		case rowIndex = "RowIndex"
		case entityID = "EntityID"
		case userNotificationID = "UserNotificationID"
		case message = "Message"
		case isViewed = "IsViewed"
		case timeAgo = "TimeAgo"
		case notificationType = "NotificationType"
		case ideaTitle = "IdeaTitle"
	}
}
