import SwiftUI
import AVFoundation

public struct GameScreen: View {
    @StateObject var game = GameController()
    @State var guess = 0
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.orange)
            VStack {
                TwoHands(isComputer: true, thumbsState: $game.computerThumbs)
                    .frame(maxHeight: .infinity)
                GameStatusHeader()
                    .environmentObject(game)
                TwoHands(isComputer: false, thumbsState: $game.playerThumbs)
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct GameStatusHeader: View {
    @EnvironmentObject var game: GameController
    
    var body: some View {
        VStack {
            Text("Round \(game.currentRound)")
                .font(.system(size: 72))
            Text(game.informationText)
                .font(.system(size: 24))
            if game.state == .playerTurn {
                HStack {
                    ForEach(0..<game.maxGuess + 1) { num in
                        Button(action: {
                            game.playerGuess(numOfThumbs: num)
                        }) {
                            Text("\(num)")
                                .font(.system(size: 24))
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(16)
                        .padding()
                    }
                }
            }
            if game.state == .roundResult {
                RoundedBlueButton(text: "Next Round") {
                    game.nextRound()
                }
            }
            if game.state == .preparation {
                RoundedBlueButton(text: "I'm ready") {
                    game.computerGuess()
                }
            }
        }
        .frame(maxHeight: .infinity)
    }
}

struct RoundedBlueButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(text)
                .font(.system(size: 24))
                .frame(width: 150, height: 50, alignment: .center)
        }
        .background(Color.blue)
        .foregroundColor(Color.white)
        .cornerRadius(16)
        .padding()
    }
}
