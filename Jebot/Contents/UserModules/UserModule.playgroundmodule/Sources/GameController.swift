import SwiftUI
import PlaygroundSupport

public class GameController: ObservableObject {
    @Published var computerThumbs = Array(repeating: false, count: 2)
    @Published var playerThumbs = Array(repeating: false, count: 2)
    @Published var currentRound = 1
    @Published var informationText = "How much thumbs up do you think will appear ?"
    @Published var maxGuess = 4
    
    enum GameState {
        case playerTurn
        case roundResult
        case preparation
        case computerTurn
        case theEnd
    }
    @Published var state: GameState = .playerTurn
    
    public func playerGuess(numOfThumbs playerGuess: Int) -> Void {
        let computerThumbsUp = Int.random(in: 0...computerThumbs.count)
        
        for i in 0 ..< computerThumbsUp {
            computerThumbs[i] = true
        }
        
        let playerThumbsUp = playerThumbs.filter({ $0 }).count
        if playerThumbsUp + computerThumbsUp == playerGuess {
            informationText = "You guessed it right! it's \(playerGuess)"
            maxGuess -= 1
            
            if playerThumbs.count - 1 >= 1 {
                playerThumbs = Array(repeating: false, count: playerThumbs.count - 1)
            } else {
                showWinner(for: "Player")
            }
        } else {
            informationText = "You gusssed it wrong!"
        }
        
        state = .roundResult
    }
    
    public func computerGuess() -> Void {
        let computerGuess = Int.random(in: 0..<computerThumbs.count + playerThumbs.count)
        let computerThumbsUp = Int.random(in: 0...computerThumbs.count)
        
        for i in 0 ..< computerThumbsUp {
            computerThumbs[i] = true
        }
        
        let playerThumbsUp = playerThumbs.filter({ $0 }).count
        if playerThumbsUp + computerThumbsUp == computerGuess {
            informationText = "Computer guessed it right! it's \(computerGuess)"
            maxGuess -= 1
            
            if computerThumbs.count - 1 >= 1 {
                computerThumbs = Array(repeating: false, count: computerThumbs.count - 1)
            } else {
                showWinner(for: "Computer")
            }
        } else {
            informationText = "Computer gusssed it wrong!"
        }
        
        state = .roundResult
    }
    
    public func nextRound() {
        currentRound += 1
        
        if currentRound % 2 == 0 {
            informationText = "Prepare your hands and tell your opponent that you're ready!"
            state = .preparation
        } else {
            informationText = "It's your turn, pick a number!"
            state = .playerTurn
        }
        
        computerThumbs = Array(repeating: false, count: computerThumbs.count)
        playerThumbs = Array(repeating: false, count: playerThumbs.count)
    }
    
}

public func startGame() -> Void {
    PlaygroundPage.current.setLiveView(GameScreen())
}

public func showStartScreen() -> Void {
    PlaygroundPage.current.setLiveView(StartScreen())
}

public func showWinner(for winner: String) -> Void {
    PlaygroundPage.current.setLiveView(WinnerScreen(winner: winner))
}
