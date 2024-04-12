//
//  DetailsView.swift
//  H4XOR
//
//  Created by Vinod Nayak Banavath on 12/04/24.
//

import SwiftUI
import WebKit

struct DetailsView: View {

    let url: String?
    @State private var isLoading = true
    @State private var error: Error? = nil

    var body: some View {
        ZStack {
            if let error {
                Text(error.localizedDescription)
                    .foregroundColor(.pink)
            } else if let url {
                WebView(urlString: url,
                        isLoading: $isLoading,
                        error: $error)
                    .edgesIgnoringSafeArea(.all)
                if isLoading {
                    //ProgressView()
                }else {
                    //EmptyView()
                }
            } else {
                Text("Sorry, We could not load this url.")
            }
        }
    }
}

#Preview {
    DetailsView(url: "https//www.google.com")
}


