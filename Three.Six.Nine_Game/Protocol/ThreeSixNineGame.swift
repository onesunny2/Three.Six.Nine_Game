//
//  ThreeSixNineGame.swift
//  Three.Six.Nine_Game
//
//  Created by Lee Wonsun on 1/9/25.
//

import Foundation

protocol ThreeSixNineGame: AnyObject {
    var gameNum: [String] { get }
    var newGameNum: [String] { get }
    var clapCount: Int { get }

    func changeToClap(_ row: Int)
}
