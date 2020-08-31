//
//  ImageView.swift
//  Coins-Explorer
//
//  Created by Spiros Gerokostas on 23/8/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageView: View {
  let path: String?
  let size: CGFloat

  var body: some View {
    WebImage(url: path != nil ? URL(string: path!) : nil)
      .resizable()
      .renderingMode(.original)
      .indicator(.activity)
      .animation(.easeInOut(duration: 0.2))
      .transition(.fade)
      .aspectRatio(contentMode: .fit)
      .frame(width: size, height: size)
      .animation(.spring())
  }
}

struct ImageView_Previews: PreviewProvider {
  static var previews: some View {
    ImageView(path: "", size: 20)
  }
}
