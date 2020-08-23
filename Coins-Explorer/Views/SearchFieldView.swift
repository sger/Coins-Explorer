//
//  SearchFieldView.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import SwiftUI

struct SearchFieldView: View {
  @Binding var searchText: String
  var placeholder: LocalizedStringKey = "Search..."

  var body: some View {
    HStack {
      Image(systemName: "magnifyingglass")
        .imageScale(.large)
        .foregroundColor(.gray)
      TextField(placeholder, text: $searchText)
        .foregroundColor(.gray)
        .font(.headline)
        .accentColor(.gray)
        .textCase(nil)
      if !searchText.isEmpty {
        Button(action: {
          self.searchText = ""
        }) {
          Image(systemName: "xmark.circle")
            .font(.headline)
            .foregroundColor(.gray)
            .imageScale(.medium)
        }.buttonStyle(BorderlessButtonStyle())
      }
    }
    .padding(8)
    .background(Color.white)
    .mask(RoundedRectangle(cornerRadius: 8, style: .continuous))
    .padding(2)
  }
}

struct SearchFieldView_Previews: PreviewProvider {
  static var previews: some View {
    SearchFieldView(searchText: .constant("Test"))
  }
}
