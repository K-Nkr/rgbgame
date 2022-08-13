//
//  ContentView.swift
//  colorgame
//
//

import SwiftUI

struct ContentView: View {
    @State private var redRatio     = 1.0
    @State private var greenRatio   = 1.0
    @State private var blueRatio    = 1.0
    @State private var redAns       = round(Double.random(in:0...100))/100
    @State private var greenAns     = round(Double.random(in:0...100))/100
    @State private var blueAns      = round(Double.random(in:0...100))/100
    @State var buttonText = "ShowScores"
    @State var rAnsvar = "red"
    @State var gAnsvar = "green"
    @State var bAnsvar = "blue"
    var body: some View {
        VStack {
            HStack {
                Color(red: redAns, green: greenAns, blue: blueAns)
                    .frame(width: 150, height: 150)
                Color(red: redRatio, green: greenRatio, blue: blueRatio)
                    .frame(width: 150, height: 150)
            }
            AdjustmentView(parameterName: "Red", parameter: $redRatio)
            AdjustmentView(parameterName: "Green", parameter: $greenRatio)
            AdjustmentView(parameterName: "Blue", parameter: $blueRatio)
            HStack {
                Button(action: {
                    var score=fabs(redAns-redRatio)+fabs(blueAns-blueRatio)+fabs(greenAns-greenRatio)
                    score=100-round(score*333)/10
                    buttonText = String(score)
                }){
                    Text(buttonText)
                }
                Button(action: {
                    buttonText = "ShowScores"
                    redAns     = round(Double.random(in:0...100))/100
                    blueAns     = round(Double.random(in:0...100))/100
                    greenAns     = round(Double.random(in:0...100))/100
                }){
                    Text("Reset")
                }
            }
            HStack {
                Button(action: {
                    rAnsvar=String(redAns)
                }){
                    Text(rAnsvar)
                }
                Button(action: {
                    gAnsvar=String(greenAns)
                }){
                    Text(gAnsvar)
                }
                Button(action: {
                    bAnsvar=String(blueAns)
                }){
                    Text(bAnsvar)
                }
            }
        }
    }
}
 
struct AdjustmentView: View {
    var parameterName: String
    @Binding var parameter: Double
    
    var body: some View {
        HStack {
            Text(parameterName)
                .frame(width: 60)
            Slider(value: $parameter, in: 0...1, step: 0.01)
            Text("\(parameter, specifier: "%.2f")")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
