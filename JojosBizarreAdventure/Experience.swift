//
//  SwiftUIView.swift
//  Jojo's bizarre adventure
//
//  Created by User16 on 2021/11/27.
//

import SwiftUI

struct ExperienceView: View {
    let animation = ["第一部：幻影血脈", "第二部：戰鬥潮流", "第三部：星辰遠征軍", "第四部：不滅鑽石",
        "第五部：黃金之風"
    ]
    @Binding var data: [Experiences]
    @State private var selectedIndex: Int = 0
    @State private var name: String = ""
    @State private var message: String = ""
    @State private var showAlert = false
    @State private var alertTitle = ""
    var body: some View {
        NavigationView{
            Form {
                Picker(selection: $selectedIndex, label: Text("選擇動畫")) {
                    Text(animation[0]).tag(0)
                    Text(animation[1]).tag(1)
                    Text(animation[2]).tag(2)
                    Text(animation[3]).tag(3)
                    Text(animation[4]).tag(4)
                }
                .foregroundColor(Color.black)
            
                TextField("最喜歡的角色", text: $name)                .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
                    .foregroundColor(Color.black)
                ZStack(alignment:.topLeading){
                    if (message == ""){
                        Text("原因：")
                            .foregroundColor(.gray)
                            .offset(x: 5, y: 5)
                    }
                    TextEditor(text: $message)
                        .frame(width: 200, height: 200)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                        .foregroundColor(Color.black)
                }
                Button("新增此心得") {
                    showAlert = true
                    data.append(Experiences(num: selectedIndex, member: name, reason: message))
                    alertTitle = "新增成功!"
                }
                .foregroundColor(Color.blue)
                .alert(isPresented: $showAlert) { () -> Alert in
                        let answer = "新增成功！"
                        return Alert(title: Text(answer))
                }
            }
        }
    }
}

struct ExperienceView_Previews: PreviewProvider {
    
    struct demo:View {
        @State private var data: [Experiences] = []
        
        var body: some View{
            ExperienceView(data: $data)
        }
        
    }
    
    
    static var previews: some View {
        demo()
    }
}
