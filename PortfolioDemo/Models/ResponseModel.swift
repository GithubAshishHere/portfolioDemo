
import Foundation
struct ResponseModel : Codable {
	let status : Bool?
	let message : String?
	let data : Data?

	enum CodingKeys: String, CodingKey {

		case status = "status"
		case message = "message"
		case data = "data"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		status = try values.decodeIfPresent(Bool.self, forKey: .status)
		message = try values.decodeIfPresent(String.self, forKey: .message)
		data = try values.decodeIfPresent(Data.self, forKey: .data)
	}
    
}

class GetItem{
    let serviceManager = ServiceManager()
    func getItems(_ offset: Int, limit: Int, completionHandler: @escaping (Data) -> Void) {
        self.serviceManager.itemFetch(offset, limit: offset) { (res) in
            completionHandler(res)
        }
        
    }
}
