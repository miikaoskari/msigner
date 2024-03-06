//
//  SettingsView.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import SwiftUI

struct SettingsView: View {
    @State var isDarkModeEnabled: Bool = true
    @State var downloadViaWifiEnabled: Bool = false
    @State private var password: String = ""
    @State var isImporting: Bool = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    HStack {
                        Image(systemName: "globe")
                        Picker(selection: /*@START_MENU_TOKEN@*/.constant(1)/*@END_MENU_TOKEN@*/, label: Text("Language")) {
                            Text("English").tag(1)
                            Text("Finnish").tag(2)
                        }
                    }
                    HStack {
                        Image(systemName: "moon")
                        Toggle(isOn: $isDarkModeEnabled, label: {
                            Text("Dark Mode")
                        })
                    }
                }
                Section(header: Text("Signatures")) {
                    HStack {
                        Image(systemName: "person")
                        Text("Provisioning Profile")
                    }.onTapGesture(perform: {
                        isImporting = true
                    })
                    HStack {
                        Image(systemName: "signature")
                        Text("Signing Certificate")
                    }.onTapGesture(perform: {
                        isImporting = true
                    })
                    HStack {
                        Image(systemName: "lock")
                        SecureField("Signature Password", text: $password)
                    }
                }
                
            }
            .navigationTitle("Settings")
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
}

#Preview {
    SettingsView()
}
