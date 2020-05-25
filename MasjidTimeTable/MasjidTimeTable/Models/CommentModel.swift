

import Foundation
struct CommentModel : Codable {
	let userName : String?
	let comment : String?
	let timeStamp : String?

	enum CodingKeys: String, CodingKey {

		case userName = "UserName"
		case comment = "Comment"
		case timeStamp = "TimeStamp"
	}

}
