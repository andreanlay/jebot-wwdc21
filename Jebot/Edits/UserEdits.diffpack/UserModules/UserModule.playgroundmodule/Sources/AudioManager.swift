import AVFoundation

public class AudioManager {
    static var sharedManager = AudioManager()
    
    private var backgroundMusicPlayer: AVAudioPlayer!
    private var soundEffectPlayer: AVAudioPlayer!
    private var musicList = [
        "backgroundMusic": Bundle.main.url(forResource: "music", withExtension: "mp3"),
        "buttonClick": Bundle.main.url(forResource: "click", withExtension: "wav"),
        "roundWin": Bundle.main.url(forResource: "roundWin", withExtension: "wav"),
        "roundLose": Bundle.main.url(forResource: "roundLose", withExtension: "wav"),
        "one": Bundle.main.url(forResource: "one", withExtension: "mp3"),
        "two": Bundle.main.url(forResource: "two", withExtension: "mp3"),
        "three": Bundle.main.url(forResource: "three", withExtension: "mp3"),
        "four": Bundle.main.url(forResource: "four", withExtension: "mp3"),
        "zero": Bundle.main.url(forResource: "zero", withExtension: "mp3"),
    ]
    private var numberToText = ["Zero", "One", "Two", "Three", "Four"]
    
    public func playBackgroundMusic() -> Void {
        if let url = musicList["backgroundMusic"] {
            try? backgroundMusicPlayer = AVAudioPlayer(contentsOf: url!)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.setVolume(0.25, fadeDuration: 2)
            backgroundMusicPlayer.play()
        }
    }
    
    public func playSoundEffect(for sound: String) -> Void {
        if let url = musicList[sound] {
            try? soundEffectPlayer = AVAudioPlayer(contentsOf: url!)
            soundEffectPlayer.play()
        }
    }
    
    public func speakGuessedNumber(for number: Int) -> Void {
        let utterance = AVSpeechUtterance(string: numberToText[number])
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.pitchMultiplier = 1.25
        
        AVSpeechSynthesizer().speak(utterance)
    }
}
