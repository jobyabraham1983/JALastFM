//
//  JASearchView.swift
//  JALastFM
//
//  Created by joby.abraham on 02/07/21.
//

import SwiftUI

struct JASearchResultRow: View {
    var album : JAMusic
    var body: some View {
        HStack {
            // Image View
            let imageUrl = URL(string:self.album.image(size: .large))
            AsyncImage(url:imageUrl ?? URL(fileURLWithPath: ""),
                       placeholder: {
                        Image("EmptyImage").resizable()
                            .clipShape(Circle())
                            .frame(width: 50, height: 50, alignment: .center)},
                       image: {
                        Image(uiImage: $0).resizable()
                       })
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(album.name())
                    .foregroundColor(.black)
                    .font(.headline)
                    .accessibility(identifier: "SearchResultLabelId")
                Text(album.url())
                    .foregroundColor(.black)
                    .font(.subheadline)
            }
        }
    }
}

struct JAMusicSearchView: View {
    @State var dataSource: [JAMusic]
    @State var keyword: String
    @State private var method = "Album"
    static let options = [
        JADropdownOption(key: "Album", val: "Album"),
        JADropdownOption(key: "Artist", val: "Artist"),
        JADropdownOption(key: "Track", val: "Track")
    ]

    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        HStack {
                            JADropdownButton(shouldShowDropdown: false, displayText: $method, options: JAMusicSearchView.options) { selection in
                                self.method = selection
                            }
                        }
                        TextField("Keyword", text: $keyword)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(height: 40.0)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                            .border(Color(UIColor.separator))
                            .foregroundColor(.black)
                            .accessibility(identifier: "KeywordControlId")
                        Spacer(minLength: 16)
                        Button(action: {
                            self.dataSource.removeAll()
                            JAMusicSearchManager.sharedInstance.search(method: method, keyword: keyword) { data in
                                self.dataSource.append(contentsOf: data)
                            }
                        }, label: {
                            Text("Search")
                        })
                        .frame(width: 100.0, height: 40.0)
                        .font(.headline)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .accessibility(identifier: "SearchButtonId")
                    }
                    Spacer(minLength: 100)
                    List(self.dataSource){ album in
                        JASearchResultRow(album: album)
                            .accessibility(identifier: "SearchResultRowId")
                        Spacer(minLength: 16)
                        NavigationLink(destination: JAMusicDetailsView(music: album)) {
                            Text("")
                        }
                        .frame(width: 30.0, height: 30.0)
                    }.border(Color(UIColor.separator))
                    .accessibility(identifier: "SearchResultListId")
                }
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
            .navigationBarTitle("Search Music", displayMode: .inline)
        }
    }
    
    init() {
        keyword = ""
        self.dataSource = [JAMusic]()
    }
}

struct JASearchView_Previews: PreviewProvider {
    static var previews: some View {
        JAMusicSearchView()
    }
}
