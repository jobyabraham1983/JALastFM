
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct JAArtistSearchData: Codable {
    let results: JAArtistSearchResults
}

// MARK: - Results
struct JAArtistSearchResults: Codable {
    let opensearchQuery: JAArtistOpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let artistmatches: JAArtistMatches
    let attr: JAArtistAttr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case artistmatches
        case attr = "@attr"
    }
}

// MARK: - Artistmatches
struct JAArtistMatches: Codable {
    let artist: [JAArtist]
}

// MARK: - Artist
struct JAArtist: Codable {
    let name, listeners, mbid: String
    let url: String
    let streamable: String
    let image: [JAArtistImage]
}

// MARK: - Image
struct JAArtistImage: Codable {
    let text: String
    let size: JAArtistSize

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum JAArtistSize: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case mega = "mega"
    case small = "small"
}

// MARK: - Attr
struct JAArtistAttr: Codable {
    let attrFor: String

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}

// MARK: - OpensearchQuery
struct JAArtistOpensearchQuery: Codable {
    let text, role, searchTerms, startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }
}
