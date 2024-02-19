//
//  DetailView.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import SwiftUI

struct DetailView: View {
    let text: String
    var body: some View {
        VStack {
            Text("Detail view showing")
            Text(text)
        }
        .navigationTitle(text)
    }
}
