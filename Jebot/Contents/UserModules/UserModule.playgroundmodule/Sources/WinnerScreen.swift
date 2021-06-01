
import SwiftUI

struct WinnerScreen: View {
    var winner: String
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
            VStack {
                if winner == "Player" {
                    Text("You win! 😎")
                        .font(.system(size: 54))
                } else {
                    Text("Computer wins! 🤖")
                        .font(.system(size: 54))
                }
                RoundedBlueButton(text: "Main Menu") {
                    showStartScreen()
                }
            }
        }
    }
}
