//
//  RepositoriesView.swift
//  msigner
//
//  Created by Miika Karjalainen on 7.3.2024.
//

import SwiftUI

struct RepositoriesView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink(destination: SettingsView()) {
                    HStack {
                        Image(systemName: "folder")
                            .foregroundColor(.blue) // Customize image color if needed
                        Text("App 1")
                    }
                }
            }
            .navigationTitle("Repositories")
            .toolbar {
                ToolbarItem {
                    Button {
                    } label: {
                        Label("Import file",
                              systemImage: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    RepositoriesView()
}
