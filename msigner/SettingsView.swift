//
//  SettingsView.swift
//  msigner
//
//  Created by Miika Karjalainen on 18.2.2024.
//

import SwiftUI

class ProvisioningConfig: ObservableObject {
    @Published var selectedFiles: [URL] = UserDefaults.standard.array(forKey: "selectedFiles") as? [URL] ?? []
    @Published var password: String = KeychainService.loadPassword() {
        didSet {
            KeychainService.savePassword(password)
        }
    }
}

struct SettingsView: View {
    @State var isDarkModeEnabled: Bool = true
    @State var downloadViaWifiEnabled: Bool = false
    @State var isImporting: Bool = false
    @EnvironmentObject private var provisioningConfig: ProvisioningConfig
    @State private var password: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("General")) {
                    HStack {
                        Image(systemName: "globe")
                        Picker(selection: .constant(1), label: Text("Language")) {
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
                            .onChange(of: password) { newValue in
                                provisioningConfig.password = newValue
                            }
                    }
                }
                
            }
            .navigationTitle("Settings")
            .fileImporter(
                isPresented: $isImporting,
                allowedContentTypes: [.zip],
                allowsMultipleSelection: true
            ) { result in
                switch result {
                case .success(let files):
                    provisioningConfig.selectedFiles = files // Save selected file URLs
                    UserDefaults.standard.set(provisioningConfig.selectedFiles, forKey: "selectedFiles") // Save to UserDefaults
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

struct KeychainService {
    static let service = "msigner"
    
    static func savePassword(_ password: String) {
        guard let data = password.data(using: .utf8) else { return }
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "password",
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
        SecItemAdd(query as CFDictionary, nil)
    }
    
    static func loadPassword() -> String {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: service,
            kSecAttrAccount as String: "password",
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: true
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        if status == errSecSuccess {
            if let data = result as? Data,
               let password = String(data: data, encoding: .utf8) {
                return password
            }
        }
        
        return ""
    }
}
