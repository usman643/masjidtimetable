

import Foundation
struct Listing<T:Codable> : Codable {
	let pageNo : Int?
	let totalRec : Int?
	let totalPages : Int?
	let dataArr : [T]?

	enum CodingKeys: String, CodingKey {

		case pageNo = "PageNo"
		case totalRec = "TotalRec"
		case totalPages = "TotalPages"
		case dataArr = "Listing"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		pageNo = try values.decodeIfPresent(Int.self, forKey: .pageNo)
		totalRec = try values.decodeIfPresent(Int.self, forKey: .totalRec)
		totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
		dataArr = try values.decodeIfPresent([T].self, forKey: .dataArr)
	}

}
