//
//  JADropdownButton.swift
//  JALastFM
//
//  Created by joby.abraham on 05/07/21.
//

import SwiftUI

struct JADropdownOption: Hashable {
    public static func == (lhs: JADropdownOption, rhs: JADropdownOption) -> Bool {
        return lhs.key == rhs.key
    }

    var key: String
    var val: String
}

struct JADropdownOptionElement: View {
    var val: String
    var key: String
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        Button(action: {
            if let onSelect = self.onSelect {
                onSelect(self.key)
            }
        }) {
            Text(self.val)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 5)
        .foregroundColor(Color.white)
        .accessibility(identifier: "JADropdownOptionElementId")
    }
}

struct JADropdown: View {
    var options: [JADropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            ForEach(self.options, id: \.self) { option in
                JADropdownOptionElement(val: option.val, key: option.key, onSelect: self.onSelect)
            }
        }

        .background(Color.black)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
        )
    }
}

struct JADropdownButton: View {
    @State var shouldShowDropdown = false
    @Binding var displayText: String
    var options: [JADropdownOption]
    var onSelect: ((_ key: String) -> Void)?

    let buttonHeight: CGFloat = 30
    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            HStack {
                Text(displayText)
                    .foregroundColor(Color.blue)
                Spacer()
                    .frame(width: 20)
                Image(systemName: self.shouldShowDropdown ? "chevron.up" : "chevron.down")
            }
        }
        .accessibility(identifier: "JADropdownButtonId")
        .padding(.horizontal)
        .cornerRadius(5)
        .frame(height: self.buttonHeight)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.black, lineWidth: 1)
        )
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    JADropdown(options: self.options, onSelect: self.onSelect)
                }
            }, alignment: .topLeading
        )
        .background(
            RoundedRectangle(cornerRadius: 5).fill(Color.white)
        )
    }
}

struct JADropdownButton_Previews: PreviewProvider {
    @State var selection: String
    @State static var method = "Album"
    
    static let options = [
        JADropdownOption(key: "album", val: "Album"), JADropdownOption(key: "artist", val: "Artist"), JADropdownOption(key: "track", val: "Track")
    ]

    static let onSelect = { key in
        print(key)
    }

    static var previews: some View {
        JADropdownButton(shouldShowDropdown: true, displayText: $method, options: options) { selection in
            print(selection)
        }
    }
}
