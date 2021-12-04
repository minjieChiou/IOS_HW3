//
//  AnimationData.swift
//  Jojo's bizarre adventure
//
//  Created by User16 on 2021/11/27.
//

import Foundation
import SwiftUI

struct AnimationData:Identifiable {
    let id = UUID()
    let name: String
    let pic: String
    let premiereDay: String
}

extension AnimationData{
    static let Overview = [
        AnimationData(name: "第一部:幻影血脈", pic: "Jojo第一部", premiereDay: "首播日：October 6, 2012"),
        AnimationData(name: "第二部:戰鬥潮流", pic: "Jojo第二部", premiereDay: "首播日：December 14, 2012"),
        AnimationData(name: "第三部:星辰遠征軍", pic: "Jojo第三部", premiereDay: "首播日：April 4, 2014"),
        AnimationData(name: "第四部:不滅鑽石", pic: "Jojo第四部", premiereDay: "首播日：April 1, 2016"),
        AnimationData(name: "第五部:黃金之風", pic: "Jojo第五部", premiereDay: "首播日：October 5, 2018")
    ]
}

struct Experiences:Identifiable {
    let id = UUID()
    let num:Int
    let member:String
    let reason:String
}
