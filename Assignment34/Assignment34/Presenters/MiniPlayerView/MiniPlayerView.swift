//
//  MiniPlayerView.swift
//  Assignment34
//
//  Created by MacBook on 25.12.24.
//

import SwiftUI

struct MiniPlayerView: View {
    let song: SongModel
    @Binding var isPlaying: Bool
    @Binding var progress: Double
    var onPlayPause: () -> Void
    var onExpand: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Button(action: onExpand) {
                    HStack {
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
                    .contentShape(Rectangle())
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button(action: onPlayPause) {
                    Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            .padding()
            .background(Color(UIColor.secondarySystemBackground))
            .cornerRadius(10)
            
            ProgressViewWrapper(progress: $progress)
                .frame(height: 5)
                .padding([.leading, .trailing], 10)
                .padding([.bottom], 10)
        }
    }
}

#Preview {
    MiniPlayerView(
        song: SongModel(name: "Sample Song", fileName: "sample", imageName: "SampleImage", author: "Sample Author"),
        isPlaying: .constant(true),
        progress: .constant(0.5),
        onPlayPause: {},
        onExpand: {}
    )
}
