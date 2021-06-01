import SwiftUI
import AVKit
import PlaygroundSupport

struct StartScreen: View {
    @State var player: AVAudioPlayer!
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)

            VStack {
                Text("Jebot")
                    .font(.system(size: 96))
                Text("An Indonesian Traditional Game")
                    .font(.title)
                    .padding(.bottom)
                Button(action: {
                    startGame()
                }) {
                    Text("Play")
                        .font(.system(size: 20))
                        .frame(width: 200, height: 50, alignment: .center)
                }
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(16)
            }
        }
        .onAppea {
            let sound = 
        }
    }
}
