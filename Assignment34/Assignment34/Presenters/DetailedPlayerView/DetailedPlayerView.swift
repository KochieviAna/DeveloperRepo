//
//  DetailedPlayerView.swift
//  Assignment34
//
//  Created by MacBook on 25.12.24.
//

import SwiftUI

struct DetailedPlayerView: View {
    let song: SongModel
    @Binding var progress: Double
    @Binding var isPlaying: Bool
    var onPlayPause: () -> Void
    var onPrevious: () -> Void
    var onNext: () -> Void
    var onShuffle: () -> Void
    var onRepeat: () -> Void
    @Binding var isShuffleActive: Bool
    @Binding var isRepeatActive: Bool
    
    var body: some View {
        ZStack {
            if let backgroundImage = UIImage(named: song.imageName) {
                Image(uiImage: backgroundImage)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .opacity(0.2)
            } else {
                Color.black.opacity(0.2)
                    .ignoresSafeArea()
            }
            
            VStack {
                Spacer()
                
                if let songImage = UIImage(named: song.imageName) {
                    Image(uiImage: songImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                        .cornerRadius(10)
                        .shadow(radius: 10)
                        .padding()
                }
                
                VStack(spacing: 4) {
                    Text(song.name)
                        .font(.largeTitle)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Text(song.author)
                        .font(.title3)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .padding()
                
                ProgressViewWrapper(progress: $progress)
                    .frame(width: 250, height: 10)
                    .padding()
                
                HStack {
                    Button(action: onPrevious) {
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    Button(action: onPlayPause) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    
                    Button(action: onNext) {
                        Image(systemName: "forward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Button(action: onShuffle) {
                        Image(systemName: isShuffleActive ? "shuffle.circle.fill" : "shuffle.circle")
                            .padding()
                            .foregroundColor(.blue)
                    }
                    
                    Button(action: onRepeat) {
                        Image(systemName: isRepeatActive ? "repeat.1.circle.fill" : "repeat.1.circle")
                            .padding()
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}

#Preview {
    DetailedPlayerView(
        song: SongModel(
            name: "Come Here",
            fileName: "Dominic Fike - Come Here (Official Audio)",
            imageName: "Come Here",
            author: "Dominic Fike"
        ),
        progress: .constant(0.5),
        isPlaying: .constant(false),
        onPlayPause: {},
        onPrevious: {},
        onNext: {},
        onShuffle: {},
        onRepeat: {},
        isShuffleActive: .constant(false),
        isRepeatActive: .constant(false)
    )
}
