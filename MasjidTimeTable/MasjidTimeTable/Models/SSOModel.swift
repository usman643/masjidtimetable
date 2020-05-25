

import Foundation

struct SSOModel : Codable {
	let sSOLogin : String?
	let sSOGetConfiguration : String?

	enum CodingKeys: String, CodingKey {

		case sSOLogin = "SSOLogin"
		case sSOGetConfiguration = "SSOGetConfiguration"
	}

}
