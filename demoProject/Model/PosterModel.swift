import Foundation

struct Poster: Hashable, Codable {
    
    var results: [Object] = [Object]()
    
    struct Object: Hashable, Codable {
        
        var originalTitle: String? = nil
        var overview: String? = nil
        var posterPath: String? = nil
        
        enum CodingKeys: String, CodingKey {
            case originalTitle = "original_title"
            case overview
            case posterPath = "poster_path"
        }
    }
}
