import Foundation

class ImageSettings: Codable {
    var name: String?
    var like: Bool?
    var comment: String?
    
    init(name: String?, like: Bool?, comment: String?) {
        self.name = name
        self.like = like
        self.comment = comment
    }
    
    private enum CodingKeys: String, CodingKey {
        case name
        case like
        case comment
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(like, forKey: .like)
        try container.encode(comment, forKey: .comment)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.like = try container.decode(Bool.self, forKey: .like)
        self.comment = try container.decodeIfPresent(String.self, forKey: .comment)
    }
}
