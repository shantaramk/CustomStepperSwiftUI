//
//  ContentView.swift
//  CustomStepperSwiftUI
//
//  Created by Shantaram K on 29/11/19.
//  Copyright © 2019 Shantaram K. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            CustomStepper()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomStepper: View {
    @State var stepperValue: Double = 0.0
    @State var attempts: Int = 0
    @State var plusAttempt: Bool = false
    
    var body: some View {
        
        VStack(spacing: 30) {
            HStack(spacing: 15) {
                RounderButton(title: "-", value: $stepperValue) {
                    print($0)
                }
                
                Text("\(stepperValue, specifier: "%.1f")")
                    .foregroundColor(Color.red)
                
                RounderButton(title: "+", value: $stepperValue) {
                    print($0)
                }
            }
            
            HStack(spacing: 0) {
                Color.blue
                
                
                SimpleButton(title: "-", value: $stepperValue, rangeLimit: RangeLimit(min: 1.0, max: 5.0)) {
                    print($0)
                    withAnimation(.spring()) {
                        self.plusAttempt = false
                    }
                }
                
                Text("\(stepperValue, specifier: "%.1f")")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(Color.red)
                    .layoutPriority(1)
                    .modifier(SlideEffect(x: plusAttempt ? 10 : -10))
                
                SimpleButton(title: "+", value: $stepperValue, rangeLimit: RangeLimit(min: 1.0, max: 5.0)) {
                    print($0)
                    withAnimation(.easeIn) {
                        self.plusAttempt = true
                    }
                }
                
            }
            .frame(width: 200, height: 50)
            .cornerRadius(10)
            .background(Color.blue)
            
            
            HStack(spacing: 0) {
                Button(action: {}, label: {
                    Image(systemName: "plus")
                })
                
            }
            
            Spacer()
            
        }
    }
}

struct SlideEffect: GeometryEffect {
    var x: CGFloat = 0
    
    var animatableData: CGFloat {
        get { x }
        set { x = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        return ProjectionTransform(CGAffineTransform(translationX: x, y: 0))
    }
}

struct RangeLimit {
    let min: Double
    let max: Double
}

struct SimpleButton: View {
    let title: String
    @Binding var value: Double
    let rangeLimit: RangeLimit
    let action: (Double) -> Void
    
    var body: some View {
        Button(title) {
            if self.title == "+" {
                if self.value != self.rangeLimit.max {
                    self.value = self.value + 1
                }
            } else {
                if self.value != self.rangeLimit.min {
                    self.value = self.value - 1
                }
                
            }
            self.action(self.value)
        }
        .frame(width: 30, height: 30)
        .font(.title)
        .padding(EdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10))
        .foregroundColor(Color.white)
        .background(Color.blue)
        
    }
}



struct RounderButton: View {
    let title: String
    @Binding var value: Double
    let action: (Double) -> Void
    
    var body: some View {
        Button(title) {
            if self.title == "+" {
                self.value = self.value + 1
            } else {
                self.value = self.value - 1
                
            }
            self.action(self.value)
        }
        .frame(width: 30, height: 30)
        .font(.largeTitle)
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        .foregroundColor(Color.white)
        .background(Color.purple)
        .cornerRadius(26)
        .shadow(color: .red, radius: 2, y: 1)
        
    }
}

struct MBorder: View {
    let show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .stroke(lineWidth: 3.0).foregroundColor(show ? Color.red : Color.clear)
            .animation(.easeInOut(duration: 0.6))
    }
}
