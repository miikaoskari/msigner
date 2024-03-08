import SwiftUI
import MobileCoreServices
import UniformTypeIdentifiers

struct ContentView: View {
    
    
    var body: some View {
        ZStack {
            TabView {
                RepositoriesView()
                    .tabItem {
                        Label("Repositories", systemImage: "shippingbox")
                    }
                AppsView()
                    .badge(0)
                    .tabItem {
                        Label("Apps", systemImage: "apps.iphone")
                    }
                SettingsView()
                    .tabItem {
                        Label("Settings", systemImage: "gear")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
