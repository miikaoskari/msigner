import SwiftUI

struct ContentView: View {
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
                Button {
                    print("plus selected")
                } label: {
                    Image(systemName: "plus")
                }
                NavigationLink(destination: SettingsView()) {
                    Image(systemName: "gear")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
