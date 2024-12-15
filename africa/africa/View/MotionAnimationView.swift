//
//  MotionAnimationView.swift
//  africa
//
//  Created by Norman Arauz on 8/12/24.
//

import SwiftUI

struct MotionAnimationView: View {
    
    @State private var randomCircle = Int.random(in: 12...16)
    @State private var isAnimating = false
    
    private var randomCoordinate: (CGFloat) -> CGFloat {
        { .random(in: 0...$0) }
    }
    
    private var randomSize: CGFloat {
        CGFloat(Int.random(in: 10...300))
    }
    
    private var randomScale: CGFloat {
        CGFloat(Double.random(in: 0.1...2.0))
    }
    
    private var randomSpeed: Double {
        Double.random(in: 0.025...1.0)
    }
    
    private var randomDelay: Double {
        Double.random(in: 0...2)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0...randomCircle, id: \.self) { circle in
                    Circle()
                        .foregroundStyle(.gray)
                        .opacity(0.15)
                        .frame(width: randomSize, height: randomSize, alignment: .center)
                        .scaleEffect(isAnimating ? randomScale : 1)
                        .position(
                            x: randomCoordinate(geometry.size.width),
                            y: randomCoordinate(geometry.size.height)
                        )
                        .animation(
                            Animation.interpolatingSpring(stiffness: 0.5, damping: 0.5)
                                .repeatForever()
                                .speed(randomSpeed)
                                .delay(randomDelay),
                            value: isAnimating)
                        .onAppear {
                            isAnimating = true
                        }
                }
            }
            .drawingGroup()
        }
    }
}

#Preview {
    MotionAnimationView()
}
