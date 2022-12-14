import SwiftUI

struct ContentView: View {
    @State var isAnimating = false // <1>
    
    var body: some View {
        Rectangle()
            .fill(Color.pink)
            .frame(width: 100, height: 100)
            .scaleEffect(self.isAnimating ? 0.5: 1) // <3>
            .animation(Animation.linear(duration: 1).repeatForever())
            .onAppear {
                self.isAnimating = true // <2>
        }
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        window.overrideUserInterfaceStyle = .light

        let view = ContentView()
        let controller = UIHostingController(rootView: view)
        
        window.rootViewController = controller
        
        self.window = window
        window.makeKeyAndVisible()
    }
}
