//
//  NavigationSplit_03.swift
//  NavigationSplitDemo
//
//  Created by seobe22 on 11/8/23.
//

import SwiftUI

struct BandInformation: Identifiable, Hashable {
  let id = UUID()
  var bandName: String
  var members: [String]
  var membersInformation: [String]
}

struct NavigationSplit_03: View {
  let data = [
    BandInformation(bandName: "실리카겔", members: ["김한주", "김춘추", "김건제", "최웅희"], membersInformation: ["https://www.instagram.com/kimhanjooo", "https://www.instagram.com/kchunchu_92", "https://www.instagram.com/geonjaykim", "https://www.instagram.com/woonghee_man"])
  ]
  @State private var selectedBand: BandInformation?
  @State private var selectedBandmember: String?
  var body: some View {
    NavigationSplitView {
      List(data, selection: $selectedBand) { band in
        Text(band.bandName).tag(band)
      }
    } content: {
      if let selectedBand {
        List(selectedBand.members, id: \.self, selection: $selectedBandmember) { member in
          Text(member).tag(member)
        }
      } else {
        Text("ggg")
      }
    } detail: {
      if let selectedBandmember, let selectedBand {
        let index = selectedBand.members.firstIndex(of: selectedBandmember)!
        Link(destination: URL(string: selectedBand.membersInformation[index])!, label: {
          Image(systemName: "link")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(maxWidth: 90)
        })
      } else {
        Text("none")
      }
    }
    .navigationSplitViewStyle(.balanced)
  }
}

#Preview {
  NavigationSplit_03()
}
