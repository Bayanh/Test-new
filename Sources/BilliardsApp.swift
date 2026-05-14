import SwiftUI
import WebKit

@main
struct BilliardsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .ignoresSafeArea()
                .statusBar(hidden: true)
        }
    }
}

struct ContentView: UIViewRepresentable {
    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.allowsInlineMediaPlayback = true
        config.mediaTypesRequiringUserActionForPlayback = []
        
        let webView = WKWebView(frame: .zero, configuration: config)
        webView.scrollView.isScrollEnabled = false
        webView.scrollView.bounces = false
        webView.isOpaque = false
        webView.backgroundColor = .black
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        // Tải file index.html từ thư mục GameWeb
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "GameWeb") {
            webView.loadFileURL(url, allowingReadAccessTo: url.deletingLastPathComponent())
        }
    }
}

