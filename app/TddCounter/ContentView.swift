//
//  ContentView.swift
//  TddCounter
//  
//  Created on 2025/06/11
//


import SwiftUI

struct ContentView: View {
    @ObservedObject var counter: Counter
    @State private var isAnimating = false
    
    init(counter: Counter = Counter()) {
        self.counter = counter
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // グラデーション背景
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color.blue.opacity(0.6),
                        Color.purple.opacity(0.8),
                        Color.pink.opacity(0.6)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                // メインコンテンツ
                VStack(spacing: 50) {
                    // タイトル
                    VStack(spacing: 10) {
                        Text("Beautiful")
                            .font(.system(size: 28, weight: .light, design: .rounded))
                            .foregroundColor(.white.opacity(0.9))
                        
                        Text("Counter")
                            .font(.system(size: 36, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 50)
                    
                    Spacer()
                    
                    // カウンター表示
                    ZStack {
                        // 背景円
                        Circle()
                            .fill(.ultraThinMaterial)
                            .frame(width: 200, height: 200)
                            .shadow(color: .black.opacity(0.2), radius: 20, x: 0, y: 10)
                        
                        // カウンター数値
                        Text("\(counter.value)")
                            .font(.system(size: 64, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .scaleEffect(isAnimating ? 1.1 : 1.0)
                            .animation(.easeInOut(duration: 0.2), value: isAnimating)
                    }
                    
                    Spacer()
                    
                    // ボタンエリア
                    HStack(spacing: 60) {
                        // デクリメントボタン
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                counter.decrement()
                                triggerAnimation()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                                
                                Image(systemName: "minus")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PressedButtonStyle())
                        
                        // インクリメントボタン
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.3)) {
                                counter.increment()
                                triggerAnimation()
                            }
                        }) {
                            ZStack {
                                Circle()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 80, height: 80)
                                    .shadow(color: .black.opacity(0.3), radius: 10, x: 0, y: 5)
                                
                                Image(systemName: "plus")
                                    .font(.system(size: 30, weight: .bold))
                                    .foregroundColor(.white)
                            }
                        }
                        .buttonStyle(PressedButtonStyle())
                    }
                    .padding(.bottom, 80)
                }
            }
        }
    }
    
    private func triggerAnimation() {
        isAnimating = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            isAnimating = false
        }
    }
}

// カスタムボタンスタイル
struct PressedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeInOut(duration: 0.1), value: configuration.isPressed)
    }
}

#Preview {
    ContentView()
}
