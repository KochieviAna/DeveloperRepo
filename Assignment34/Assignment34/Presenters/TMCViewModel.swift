//
//  SwiftUIView.swift
//  Assignment34
//
//  Created by MacBook on 25.12.24.
//

import AVFoundation
import SwiftUI

class MusicPlayerViewModel: ObservableObject {
    @Published var songs: [SongModel] = [
        SongModel(name: "Song 1", fileName: "song1", imageName: "song1Image", author: "song1Author"),
        SongModel(name: "Song 2", fileName: "song2", imageName: "song2Image", author: "song2Author"),
        SongModel(name: "Song 3", fileName: "song3", imageName: "song3Image", author: "song3Author"),
        SongModel(name: "Song 4", fileName: "song4", imageName: "song4Image", author: "song4Author"),
        SongModel(name: "Song 5", fileName: "song5", imageName: "song5Image", author: "song5Author")
    ]
    
    @Published var currentSong: SongModel?
    @Published var isPlaying: Bool = false
    @Published var progress: Double = 0.0
    @Published var showDetails: Bool = false
    
    @Published var isShuffleActive: Bool = false
    @Published var isRepeatActive: Bool = false
    
    private var currentIndex: Int? {
        guard let currentSong = currentSong else { return nil }
        return songs.firstIndex { $0.name == currentSong.name }
    }
    
    private var player: AVAudioPlayer?
    private var progressTimer: Timer?
    
    init() {
        startProgressUpdater()
    }
    
    func playSong(_ song: SongModel) {
        self.currentSong = song
        self.isPlaying = true
        guard let url = Bundle.main.url(forResource: song.fileName, withExtension: "mp3") else {
            print("Song not found: \(song.fileName)")
            return
        }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
            player?.play()
            currentSong = song
            isPlaying = true
            startProgressUpdater()
        } catch {
            print("Error playing song: \(error)")
        }
    }
    
    func pauseOrResume() {
        guard let player = player else { return }
        
        if isPlaying {
            player.pause()
        } else {
            player.play()
        }
        isPlaying.toggle()
    }
    
    func previousSong() {
        if isShuffleActive {
            playRandomSong()
        } else {
            guard let currentIndex = currentIndex, currentIndex > 0 else { return }
            playSong(songs[currentIndex - 1])
        }
    }
    
    func nextSong() {
        if isShuffleActive {
            playRandomSong()
        } else {
            guard let currentIndex = currentIndex, currentIndex < songs.count - 1 else { return }
            playSong(songs[currentIndex + 1])
        }
    }
    
    func toggleShuffle() {
        isShuffleActive.toggle()
    }
    
    func toggleRepeat() {
        isRepeatActive.toggle()
    }
    
    private func playRandomSong() {
        let randomIndex = Int.random(in: 0..<songs.count)
        playSong(songs[randomIndex])
    }
    
    private func startProgressUpdater() {
        progressTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self, let player = self.player else { return }
            self.progress = player.currentTime / player.duration
        }
    }
    
    func handleSongCompletion() {
        if isRepeatActive {
            guard let currentSong = currentSong else { return }
            playSong(currentSong)
        } else {
            nextSong()
        }
    }
}
