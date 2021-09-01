//
//  JAMusicDetailsView.swift
//  JALastFM
//
//  Created by joby.abraham on 05/07/21.
//

import SwiftUI
// View for shows the details of selected result
struct JAMusicDetailsView: View {
    var music : JAMusic
    var body: some View {
        VStack(alignment: .center) {
            // Image View
            let imageUrl = URL(string:self.music.image(size: .large))
            AsyncImage(url:imageUrl ?? URL(fileURLWithPath: ""),
                       placeholder: {
                        Image("EmptyImage").resizable()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100, alignment: .center)},
                       image: {
                        Image(uiImage: $0).resizable()
                       })
                .frame(width: 100.0, height: 100.0)
                .clipShape(Circle())
            // Music name view
            HStack {
                Text("Music\t\t\t: \(music.name())")
                    .accessibility(identifier: "JAMusicDetailsViewNameLabelId")
                Spacer(minLength: 16)
            }
            // Music name view
            HStack {
                Text("Url\t\t\t\t:")
                Text("\(music.url())")
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .onTapGesture {
                        UIApplication.shared.open(URL(string: "\(music.url())")!)
                    }
                Spacer(minLength: 16)
            }
            // Music artist view
            let album = music.album
            if album != nil {
                VStack {
                    HStack {
                        Text("Artist\t\t\t: \(album!.artist)")
                        Spacer(minLength: 16)
                    }
                    HStack {
                        Text("Streamable\t\t: \(album!.streamable)")
                        Spacer(minLength: 16)
                    }
                }
            }
            // Music artist view
            let artist = music.artist
            if artist != nil {
                VStack {
                    HStack {
                        Text("Streamable\t\t: \(artist!.streamable)")
                        Spacer(minLength: 16)
                    }
                }
            }
            // Music artist view
            let track = music.track
            if track != nil {
                VStack {
                    HStack {
                        Text("Artist\t\t\t: \(track!.artist)")
                        Spacer(minLength: 16)
                    }
                    HStack {
                        Text("Streamable\t\t: \(track!.streamable.rawValue)")
                        Spacer(minLength: 16)
                    }
                }
            }
            
            Spacer()
        }
        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct JAMusicDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let album = JAMusic(
            id: NSUUID().uuidString,
            album : nil,
            artist: nil,
            track: nil)
        JAMusicDetailsView(music: album)
    }
}

