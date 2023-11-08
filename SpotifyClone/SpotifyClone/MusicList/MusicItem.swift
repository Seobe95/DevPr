//
//  MusicItemView.swift
//  SpotifyClone
//
//  Created by seobe22 on 11/7/23.
//

import SwiftUI

struct MusicItem: View {
    var body: some View {
      HStack(alignment: .center) {
        Image(systemName: "square.and.arrow.up.fill")
          .font(.system(size: 60))
          
        
        VStack(alignment: .leading) {
          Text("노래 제목")
            .font(.title)
          Text("가수")
            .font(.body)
        }
        
        Spacer()
        
        Button {
          
        } label: {
          Image(systemName: "ellipsis")
        }
        .foregroundStyle(.gray)
        .font(.system(size: 30))
      }.padding(.horizontal, 10)
    }
}

#Preview {
    MusicItem()
}
