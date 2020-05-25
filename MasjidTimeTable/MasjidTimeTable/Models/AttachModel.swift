

import Foundation
struct AttachModel : Codable {
	let fileID : String?
	let contentTtpe : String?
	let thumbnailURL : String?
	let imageURL : String?

	enum CodingKeys: String, CodingKey {

		case fileID = "FileID"
		case contentTtpe = "ContentTtpe"
		case thumbnailURL = "ThumbnailURL"
		case imageURL = "ImageURL"
	}

}
