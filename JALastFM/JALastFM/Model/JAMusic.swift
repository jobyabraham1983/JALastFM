//
//  JAMusic.swift
//  JALastFM
//
//  Created by joby.abraham on 02/07/21.
//

import Foundation

struct JAMusic : Identifiable {
    var id: String
    var album : JAAlbum?
    var artist : JAArtist?
    var track : JATrack?
    
    func image(size:JAImageSize) -> String {
        if album != nil {
            for image in album!.image {
                if image.size.rawValue == size.rawValue {
                    return image.text
                }
            }
        } else if artist != nil {
            for image in artist!.image {
                if image.size.rawValue == size.rawValue {
                    return image.text
                }
            }
        } else if track != nil {
            for image in track!.image {
                if image.size.rawValue == size.rawValue {
                    return image.text
                }
            }
        }
        
        return ""
    }
    
    func name() -> String {
        var name: String = ""
        if album != nil {
            name = album!.name
        } else if artist != nil {
            name = artist!.name
        } else if track != nil {
            name = track!.name
        }
        
        return name
    }
    
    func url() -> String {
        var url: String = ""
        if album != nil {
            url = album!.url
        } else if artist != nil {
            url = artist!.url
        } else if track != nil {
            url = track!.url
        }
        
        return url
    }
}

enum JAImageSize: String {
    case large = "large"
    case medium = "medium"
    case small = "small"
}
