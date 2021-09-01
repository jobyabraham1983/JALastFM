//
//  JAAlbumSearchData.swift
//  JALastFM
//
//  Created by joby.abraham on 03/07/21.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

// MARK: - Welcome
struct JAAlbumSearchData: Codable {
    let results: JAAlbumSearchResults
}

// MARK: - Results
struct JAAlbumSearchResults: Codable {
    let opensearchQuery: JAAlbumOpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let albummatches: JAAlbumMatches
    let attr: JAAlbumAttr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case albummatches
        case attr = "@attr"
    }
}

// MARK: - Albummatches
struct JAAlbumMatches: Codable {
    let album: [JAAlbum]
}

// MARK: - Album
struct JAAlbum: Codable {
    let name, artist: String
    let url: String
    let image: [JAAlbumImage]
    let streamable, mbid: String
}

// MARK: - Image
struct JAAlbumImage: Codable {
    let text: String
    let size: JAAlbumSize

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum JAAlbumSize: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

// MARK: - Attr
struct JAAlbumAttr: Codable {
    let attrFor: String

    enum CodingKeys: String, CodingKey {
        case attrFor = "for"
    }
}

// MARK: - OpensearchQuery
struct JAAlbumOpensearchQuery: Codable {
    let text, role, searchTerms, startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, searchTerms, startPage
    }
}
