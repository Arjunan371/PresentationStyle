//
//  ContentView.swift
//  PresentationStyle
//
//  Created by Arjunan on 18/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var isSelect: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: "globe")
                Text("Hello, world!")
            }
            .padding()
            .onTapGesture {
                isSelect.toggle()
            }
        }
        .fullScreenCover(isPresented: $isSelect, content: {
            if #available(iOS 16.4, *) {
                NewView()
                    .presentationBackground(Color.black.opacity(0.5))
            } else {
                NewView()
                    .background(ClearBackgroundView())
            }

        })
    }
}

struct NewView: View {
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            Text("newScreen")
        }
    }
}

#Preview {
    ContentView()
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        return InnerView()
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
    }
    
    private class InnerView: UIView {
        override func didMoveToWindow() {
            super.didMoveToWindow()
            superview?.superview?.backgroundColor = .clear
        }
        
    }
}

