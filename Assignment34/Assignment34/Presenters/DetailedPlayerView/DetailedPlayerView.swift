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
                    .frame(height: 10)
                    .padding()
                
                HStack {
                    Button(action: onPrevious) {
                        Image(systemName: "backward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
                    }
                    
                    Spacer()
                    
                    Button(action: onPlayPause) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .font(.largeTitle)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                    }
                    
                    Spacer()
                    
                    Button(action: onNext) {
                        Image(systemName: "forward.fill")
                            .font(.largeTitle)
                            .foregroundColor(.blue)
                            .padding()
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
        song: SongModel(name: "Sample Song", fileName: "sample", imageName: "SampleImage", author: "Sample Author"),
        progress: .constant(0.5),
        isPlaying: .constant(false),
        onPlayPause: {},
        onPrevious: {},
        onNext: {}
    )
}
