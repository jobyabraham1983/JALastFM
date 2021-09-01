//
//  JATrackSearchData.swift
//  JALastFM
//
//  Created by joby.abraham on 04/07/21.
//
import Foundation

// MARK: - Welcome
struct JATrackSearchData: Codable {
    let results: JATrackSearchResults
}

// MARK: - Results
struct JATrackSearchResults: Codable {
    let opensearchQuery: JATrackOpensearchQuery
    let opensearchTotalResults, opensearchStartIndex, opensearchItemsPerPage: String
    let trackmatches: JATrackmatches
    let attr: JATrackAttr

    enum CodingKeys: String, CodingKey {
        case opensearchQuery = "opensearch:Query"
        case opensearchTotalResults = "opensearch:totalResults"
        case opensearchStartIndex = "opensearch:startIndex"
        case opensearchItemsPerPage = "opensearch:itemsPerPage"
        case trackmatches
        case attr = "@attr"
    }
}

// MARK: - Attr
struct JATrackAttr: Codable {
}

// MARK: - OpensearchQuery
struct JATrackOpensearchQuery: Codable {
    let text, role, startPage: String

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case role, startPage
    }
}

// MARK: - Trackmatches
struct JATrackmatches: Codable {
    let track: [JATrack]
}

// MARK: - Track
struct JATrack: Codable {
    let name, artist: String
    let url: String
    let streamable: JATrackStreamable
    let listeners: String
    let image: [JATrackImage]
    let mbid: String
}

// MARK: - Image
struct JATrackImage: Codable {
    let text: String
    let size: JATrackSize

    enum CodingKeys: String, CodingKey {
        case text = "#text"
        case size
    }
}

enum JATrackSize: String, Codable {
    case extralarge = "extralarge"
    case large = "large"
    case medium = "medium"
    case small = "small"
}

enum JATrackStreamable: String, Codable {
    case fixme = "FIXME"
}

