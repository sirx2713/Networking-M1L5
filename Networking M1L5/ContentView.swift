//
//  ContentView.swift
//  Networking M1L5
//
//  Created by Chris Ching on 2023-08-03.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            
            print("\(Thread.current): Start onAppear Work")
            
            Task {
                await longTask()
                print("\(Thread.current): After Long Task")
                
                await MainActor.run {
                    print("Displaying some data on the screen")
                }
                
            }
            
            print("\(Thread.current): Other onAppear Work")
        }
    }
        
    func longTask() async {
        print("\(Thread.current): Long Task")
    }
}

#Preview {
    ContentView()
}
