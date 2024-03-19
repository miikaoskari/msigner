//
//  AppsView.swift
//  msigner
//
//  Created by Miika Karjalainen on 7.3.2024.
//

import SwiftUI
import UniformTypeIdentifiers

struct AppsView: View {
    @State private var text = ""
    @State private var error: Error?
    @State private var isImporting = false
    @State private var isSigning = false
    
    var body: some View {
        NavigationStack {
            if isSigning {
                ProgressView()
            }
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
            allowedContentTypes: [.ipa],
            allowsMultipleSelection: false
        ) { result in
            switch result {
            case .success(let urls):
                if let url = urls.first {
                    print(url)
                    
                    // set progressView as visible
                    isSigning = true
                    
                    
                    let signer = Signer()
                    // unzip ipa
                    signer.unZipIPA(ipaPath: url, destinationPath: .temporaryDirectory)
                    
                    // perform signing operations
                    signer.signIPAFile(unzippedIpaPath: .temporaryDirectory, dylibPath: URL(string: "")!)
                    
                    // zip back to ipa
                    signer.zipIPA(unzippedIpaPath: .temporaryDirectory, destinationPath: url, zipFileName: generateRandomString(length: 12) + ".ipa")
                    print("success")
                }
            case .failure(let error):
                // Handle error
                print(error.localizedDescription)
            }
        }
    }
}

func generateRandomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return String((0..<length).map { _ in letters.randomElement()! })
}


#Preview {
    AppsView()
}
