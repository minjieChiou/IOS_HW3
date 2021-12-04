//
//  Column.swift
//  Jojo's bizarre adventure
//
//  Created by User16 on 2021/11/27.
//

import SwiftUI

struct Column: View {
    @Binding var open:Bool
    @Binding var name: [AnimationData]
    @Binding var data: [Experiences]
    @State private var bgColor = Color.white
    
    var body: some View {
            Form{
                if data.isEmpty{
                    Text("現在還沒有心得喔！")
                }
                else{
                    DisclosureGroup("心得列表") {
                        ForEach(data) { e in
                            Text("觀看的是：" + name[e.num].name)
                            Text("最喜歡的成員：" + e.member)
                            Text("原因：" + e.reason)
                            Spacer()
                        }
                    }
                        .background(bgColor)
                        .padding()
                        .toolbar {
                            EditButton()
                        }
                }
                Spacer()
                ColorPicker("選擇背景顏色", selection: $bgColor)
                Button("關閉此頁面"){
                    open = false
                }
                .foregroundColor(.blue)
            }
    }
}

struct Column_Previews: PreviewProvider {
    struct demo:View {
        @State private var open = true
        @State private var data = AnimationData.Overview
        @State private var experiences: [Experiences] = [Experiences(num: 1, member: "str", reason: "str2213213212313213212311454765515684561"), Experiences(num: 2, member: "str", reason: "str2")]
        var body:some View{
            Column(open: $open, name: $data, data: $experiences)
        }
    }
    static var previews: some View {
        demo()
    }
}
