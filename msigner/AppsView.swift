//
//  AppsView.swift
//  msigner
//
//  Created by Miika Karjalainen on 7.3.2024.
//

import SwiftUI

struct AppsView: View {
    @State private var text = ""
    @State private var error: Error?
    @State private var isImporting = false
    
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Go to A", value: "App A")
                NavigationLink("Go to B", value: "App B")
            }
            .navigationDestination(for: String.self) { textValue in
                DetailView(text: textValue)
            }
            .navigationTitle("msigner")
            .toolbar {
                ToolbarItem {
                    Button {
                        isImporting = true
                    } label: {
                        Label("Import file",
                              systemImage: "square.and.arrow.down")
                    }
                }
            }
            
        }
        .fileImporter(
            isPresented: $isImporting,
            allowedContentTypes: [.pdf],
            allowsMultipleSelection: true
        ) { result in
            switch result {
            case .success(let files):
                files.forEach { file in
                    // gain access to the directory
                    let gotAccess = file.startAccessingSecurityScopedResource()
                    if !gotAccess { return }
                    // access the directory URL
                    // (read templates in the directory, make a bookmark, etc.)
                    
                    // release access
                    file.stopAccessingSecurityScopedResource()
                }
            case .failure(let error):
                // handle error
                print(error)
            }
        }
    }
}


#Preview {
    AppsView()
}
