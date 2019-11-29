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
    @State var stepperValue = 0
    var body: some View {
        
        VStack(spacing: 30) {
            HStack(spacing: 15) {
                RounderButton(title: "-", value: $stepperValue) {
                    print($0)
                }
                
                Text("\(stepperValue)")
                    .foregroundColor(Color.red)
                
                RounderButton(title: "+", value: $stepperValue) {
                    print($0)
                }
            }
            
            HStack(spacing: 0) {
                Color.blue
                
                
                SimpleButton(title: "-", value: $stepperValue) {
                    print($0)
                }
                
                Text("\(stepperValue)")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.yellow)
                    .foregroundColor(Color.red)
                    .layoutPriority(1)
                
                
                SimpleButton(title: "+", value: $stepperValue) {
                    print($0)
                }
                
            }
            .frame(width: 200, height: 50)
            .cornerRadius(10)
            Spacer()
        }
    }
}


struct SimpleButton: View {
    let title: String
    @Binding var value: Int
    let action: (Int) -> Void
    
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
        .font(.title)
        .padding(EdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12))
        .foregroundColor(Color.white)
        .background(Color.blue)
 
    }
}



struct RounderButton: View {
    let title: String
    @Binding var value: Int
    let action: (Int) -> Void
    
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
