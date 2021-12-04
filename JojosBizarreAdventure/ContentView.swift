//
//  ContentView.swift
//  Jojo's bizarre adventure
//
//  Created by User16 on 2021/11/27.
//

import SwiftUI

struct ContentView: View {
    @State private var data = AnimationData.Overview
    @State private var publishTime = Date()
    @State private var brightness: Double = 0
    @State private var pic: Int = 1
    let step = 1
    let range = 1...5
    @State private var visible:Bool = false
    @State private var edit:Bool = false
    @State private var experiences: [Experiences] = []
    @State private var watch:Bool = false
    
    var body: some View {
        ScrollView {
            Group{
                Image(data[pic-1].pic)
                    .resizable()
                    .scaledToFit()
                    .brightness(brightness)
                Button(data[pic-1].name){
                    pic = Int.random(in: 1...5)
                }
                    .background(Color.yellow)
                Text(data[pic-1].premiereDay)
            }
            Stepper(value: $pic,
                            in: range,
                            step: step) {
                        Text("")
                    }
                        .padding(10)
            Slider(value: $brightness, in: 0...1)
            DatePicker("補番の良辰吉日：", selection: $publishTime, displayedComponents: .date
            )
            Toggle(isOn: $visible) {
                    Text("顯示紀錄")
            }
            if visible{
                Button("心得列表"){
                    watch = true
                }
                .fullScreenCover(isPresented: $watch){
                    Column(open: $watch, name: $data, data: $experiences)
                }
            }
            
            Button("寫心得") {
                edit = true
            }
            .sheet(isPresented: $edit) {
                ExperienceView(data: $experiences)
            }
            .font(.system(size: 30))
            .padding(10)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(40)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

