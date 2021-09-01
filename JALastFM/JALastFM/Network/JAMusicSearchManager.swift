//
//  JAMusicSearchManager.swift
//  JALastFM
//
//  Created by joby.abraham on 02/07/21.
//

import Foundation

class JAMusicSearchManager : ObservableObject {
    private var dataSource: [ JAMusic]?
    static let sharedInstance = JAMusicSearchManager()
    private let session = URLSession.shared
    private let serverUrl = "http://ws.audioscrobbler.com/2.0/";
    private let apiKey = "74694d39fb60b64a59ea8d3e49e25856"

    private init() {
        self.dataSource = [JAMusic]()
    }
    
    func search(method:String, keyword:String, completionHandler:@escaping([JAMusic])->Void) {
        if self.dataSource != nil {
            self.dataSource!.removeAll()
            if method == "Album" {
                searchAlbum(keyword: keyword) { data in
                    if data != nil {
                        let searchResult = data?.results.albummatches.album
                        if searchResult != nil {
                            for item in searchResult! {
                                let album = JAMusic(
                                    id: NSUUID().uuidString,
                                    album : item,
                                    artist: nil,
                                    track: nil)
                                self.dataSource!.append(album)
                            }
                        }
                    }
                    completionHandler(self.dataSource!)
                }
            } else if method == "Artist" {
                searchArtist(keyword: keyword) { data in
                    if data != nil {
                        let searchResult = data?.results.artistmatches.artist
                        if searchResult != nil {
                            for item in searchResult! {
                                let album = JAMusic(
                                    id: NSUUID().uuidString,
                                    album : nil,
                                    artist: item,
                                    track: nil)
                                self.dataSource!.append(album)
                            }
                        }
                    }
                    completionHandler(self.dataSource!)
                }
            } else if method == "Track" {
                searchTrack(keyword: keyword) { data in
                    if data != nil {
                        let searchResult = data?.results.trackmatches.track
                        if searchResult != nil {
                            for item in searchResult! {
                                let track = JAMusic(
                                    id: NSUUID().uuidString,
                                    album : nil,
                                    artist: nil,
                                    track: item)
                                self.dataSource!.append(track)
                            }
                        }
                    }
                    completionHandler(self.dataSource!)
                }
            } else {
                completionHandler(self.dataSource!)
            }
        } else {
            completionHandler(self.dataSource!)
        }
    }
    
    private func searchAlbum(keyword:String, completionHanler:@escaping(JAAlbumSearchData?)->Void) -> Void {
        var requestPath = "\(self.serverUrl)?method=album.search&album=\(keyword)&api_key=\(apiKey)&format=json"
        requestPath = requestPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        let url = URL(string: requestPath)
        if url != nil {
            let urlRequest = URLRequest(url: url!)
            let task = self.session.dataTask(with: urlRequest) { data, responce, error in
                if (data != nil) {
                    let decoder = JSONDecoder()
                    do {
                        let decodedData = try decoder.decode(JAAlbumSearchData.self, from: data!);
                        completionHanler(decodedData)
                    } catch {
                        completionHanler(nil)
                    }
                } else {
                    completionHanler(nil)
                }
            }
            task.resume()
        } else {
            completionHanler(nil)
        }
    }
    
    private func searchArtist(keyword:String, completionHanler:@escaping(JAArtistSearchData?)->Void) -> Void {
        let requestPath = "\(self.serverUrl)?method=artist.search&artist=\(keyword)&api_key=\(apiKey)&format=json"
        let urlRequest = URLRequest(url: URL(string: requestPath)!)
        let task = self.session.dataTask(with: urlRequest) { data, responce, error in
            if (data != nil) {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(JAArtistSearchData.self, from: data!);
                    completionHanler(decodedData)
                } catch {

                }
            }
        }
        task.resume()
    }
    
    /* Method :searchTrack(name:completionHanler:)
     * Description : method for search music based on track information
     * name
     */
    private func searchTrack(keyword:String, completionHanler:@escaping(JATrackSearchData?)->Void) -> Void {
        let requestPath = "\(self.serverUrl)?method=track.search&track=\(keyword)&api_key=\(apiKey)&format=json"
        let urlRequest = URLRequest(url: URL(string: requestPath)!)
        let task = self.session.dataTask(with: urlRequest) { data, responce, error in
            if (data != nil) {
                let decoder = JSONDecoder()
                do {
                    let decodedData = try decoder.decode(JATrackSearchData.self, from: data!);
                    completionHanler(decodedData)
                } catch {

                }
            }
        }
        task.resume()
    }
}
