//
//  ContentView.swift
//  SwiftUIViewpager
//
//  Created by Manu Aravind on 04/10/24.
//
import SwiftUI

struct ContentView: View {
    let pages: [String] = ["Page 1", "Page 2", "Page 3", "Page 4"]
    @State private var selection = 0

    var body: some View {
        VStack {
            TabView(selection: $selection) {
                ForEach(pages.indices, id: \.self) { index in
                    Text(pages[index])
                        .font(.largeTitle)
                        .tag(index) // Tag for identifying the page
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic)) // Optional for page indicators

            HStack {
                Button(action: {
                    // Navigate to the previous page with animation
                    withAnimation {
                        if selection > 0 {
                            selection -= 1
                        }
                    }
                }) {
                    Text("Previous")
                        .padding()
                        .frame(width: 100)
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(selection == 0) // Disable if on the first page

                Spacer()

                Button(action: {
                    // Navigate to the next page with animation
                    withAnimation {
                        if selection < pages.count - 1 {
                            selection += 1
                        }
                    }
                }) {
                    Text("Next")
                        .padding()
                        .frame(width: 100)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .disabled(selection == pages.count - 1) // Disable if on the last page
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
