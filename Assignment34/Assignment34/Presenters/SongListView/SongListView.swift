//
//  SongListView.swift
//  Assignment34
//
//  Created by MacBook on 25.12.24.
//

import SwiftUI

struct SongListView: View {
    @StateObject private var viewModel = MusicPlayerViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                List(viewModel.songs, id: \.name) { song in
                    Button(action: {
                        viewModel.playSong(song)
                    }) {
                        HStack {
                            if let songImage = UIImage(named: song.imageName) {
                                Image(uiImage: songImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50)
                                    .cornerRadius(5)
                                    .padding(.trailing, 10)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(song.name)
                                    .font(.headline)
                                    .lineLimit(1)
                                Text(song.author)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .lineLimit(1)
                            }
                            Spacer()
                        }
                        .padding()
                    }
                }
                Spacer()
            }
            
            if let currentSong = viewModel.currentSong {
                VStack {
                    Spacer()
                    MiniPlayerView(
                        song: currentSong,
                        isPlaying: $viewModel.isPlaying,
                        progress: $viewModel.progress,
                        onPlayPause: viewModel.pauseOrResume,
                        onExpand: { viewModel.showDetails = true }
                    )
                    .background(Color(UIColor.systemBackground))
                    .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: -5)
                }
                .transition(.move(edge: .bottom))
                .zIndex(1)
            }
        }
        .sheet(isPresented: $viewModel.showDetails) {
            if let currentSong = viewModel.currentSong {
                DetailedPlayerView(
                    song: currentSong,
                    progress: $viewModel.progress,
                    isPlaying: $viewModel.isPlaying,
                    onPlayPause: viewModel.pauseOrResume,
                    onPrevious: viewModel.previousSong,
                    onNext: viewModel.nextSong,
                    onShuffle: viewModel.toggleShuffle,
                    onRepeat: viewModel.toggleRepeat,
                    isShuffleActive: $viewModel.isShuffleActive,
                    isRepeatActive: $viewModel.isRepeatActive
                )
            }
        }
    }
}

#Preview {
    SongListView()
}
