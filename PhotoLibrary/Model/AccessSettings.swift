import Foundation

class AccessSettings: Codable {
    
    var login: String?
    var password: String?
    
    init(login: String? = nil, password: String? = nil) {
        self.login = login
        self.password = password
    }
    
    private enum CodingKeys: String, CodingKey {
            case login
            case password
        }
    
    func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(login, forKey: .login)
            try container.encode(password, forKey: .password)
        }
        
        required init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.login = try container.decode(String.self, forKey: .login)
            self.password = try container.decode(String.self, forKey: .password)
        }
    
}
