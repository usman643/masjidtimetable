

import Foundation
struct IdeaDetail : Codable {
    var title : String?
    var description : String?
    let status : String?
	let attachments : [AttachModel]?
    let comments : [CommentModel]?
    let views: String?
    let comment: String?
    let likes: String?
    var isHot: Bool?
    let mainImageThumbnailURL: String?
    let mainImageImageURL: String?
    
	enum CodingKeys: String, CodingKey {
		case title = "Title"
		case description = "Description"
		case attachments = "Attachments"
        case status = "Status"
        case comments = "CommentsList"
        case views = "Views"
        case comment = "Comment"
        case likes = "Likes"
        case isHot = "IsHot"
        case mainImageThumbnailURL = "MainImageThumbnailURL"
        case mainImageImageURL = "MainImageImageURL"
	}

}
