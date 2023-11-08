//
//  ContentView.swift
//  NavigationSplitDemo
//
//  Created by seobe22 on 11/8/23.
//
/**
 와이드 디스플레이에서 멀티컬럼 기반의 네비게이션을 제공
 */
import SwiftUI

struct IconCategory: Identifiable, Hashable {
  let id = UUID()
  var categoryName: String
  var images: [String]
}

struct ContentView: View {
  @State private var categories = [
    IconCategory(categoryName: "Folders",
                 images:
                  ["questionmark.folder.ar",
                   "questionmark.folder",
                   "questionmark.folder.fill.ar",
                   "folder.fill.badge.gear",
                   "questionmark.folder.fill"]),
    IconCategory(categoryName: "Circles",
                 images:
                  ["book.circle",
                   "books.vertical.circle",
                   "books.vertical.circle.fill",
                   "book.circle.fill",
                   "book.closed.circle"]),
    IconCategory(categoryName: "Clouds",
                 images:
                  ["cloud.rain",
                   "cloud",
                   "cloud.drizzle.fill",
                   "cloud.fill",
                   "cloud.drizzle"])
  ]
  // 목록에서 현재 선택한 항목을 저장할 상태 변수
  @State private var selectedCategory: IconCategory?
  @State private var selectedImage: String?
  // 앱이 처음 실행될 때부터 세개의 열이 모두 표시되도록
  @State private var columnVisibility = NavigationSplitViewVisibility.all
  
  var body: some View {
    NavigationSplitView(columnVisibility: $columnVisibility) {
      List(categories, selection: $selectedCategory) { category in
        Text(category.categoryName).tag(category)
      }
    } content: {
      if let selectedCategory {
        List(selectedCategory.images, id:\.self, selection: $selectedImage) { image in
          HStack {
            Image(systemName: image)
            Text(image)
          }
        }
      } else {
        Text("Select a Category")
      }
    } detail: {
      if let selectedImage {
        Image(systemName: selectedImage)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .padding()
      } else {
        Text("Select a Image")
      }
    }
    // 디테일 뷰가 가려지는 것을 방지
    // .balanced 균형잡힌 스타일을 적용
    .navigationSplitViewStyle(.balanced)
  }
}

#Preview {
  ContentView()
}
