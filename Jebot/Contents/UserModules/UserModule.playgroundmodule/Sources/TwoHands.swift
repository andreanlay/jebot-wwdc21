
import SwiftUI

struct TwoHands: View {
    var isComputer: Bool
    @Binding var thumbsState: [Bool] 

    // Computed variables to show difference between player's hand and computer's hand
    private var thumbsDown: String {
        if isComputer {
            return "✊"
        } else {
            return "✊🏻"
        }
    }
    
    private var thumbsUp: String {
        if isComputer {
            return "👍"
        } else {
            return "👍🏻"
        }
    }
    
    var body: some View {
        HStack {
            ForEach(0..<thumbsState.count, id: \.self) { idx in
                Text(thumbsState[idx] ? thumbsUp : thumbsDown)
                    .font(.system(size: 96))
                    .onTapGesture {
                        if !isComputer {
                            print("Player to true")
                            self.thumbsState[idx].toggle()
                        }
                    }
            }
        }
    }
}
