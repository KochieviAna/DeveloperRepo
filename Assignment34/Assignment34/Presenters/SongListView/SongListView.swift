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
                        Text(song.name)
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
                    onNext: viewModel.nextSong
                )
            }
        }
    }
}

#Preview {
    SongListView()
}
