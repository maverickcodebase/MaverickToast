//
//  ContentView.swift
//  MaverickToast
//
//  Created by Sheraz Ahmed on 13/09/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showSheet = false
    
    var body: some View {
        VStack {
            MaverickToastView()
            
            Button("Show Sheet") {
                showSheet = true
            }
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.main)
            .cornerRadius(8)
            .padding()
        }
        .sheet(isPresented: $showSheet) {
            MaverickToastView()
        }
    }
}

#Preview {
    ContentView()
}
