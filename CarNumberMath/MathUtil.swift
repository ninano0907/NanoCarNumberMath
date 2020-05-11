//
//  MathUtil.swift
//  CarNumberMath
//
//  Created by Jin Won Kim on 2020/05/08.
//  Copyright © 2020 Jin Won Kim. All rights reserved.
//

import UIKit

class MathUtil: NSObject {
    
    static func transformSign(i:Int) -> String {
        switch i {
        case 42:
            return "*"
        case 43:
            return "+"
        case 45:
            return "-"
        case 47:
            return "/"
        default:
           return ""
        }
    }
    static func makeSignArr() -> [Int] {
        var calSignArr:[Int] = []
        let calArr = [43, 45, 42, 47]
        
        for _ in 0...2 {
            calSignArr.append(calArr[Int(arc4random_uniform(4))])
        }
        return calSignArr
    }
    
    static func makeNumberArr(level:Int) -> [Int] {
        var NumberArr:[Int] = []
        let limit:UInt32 = UInt32(10 - level)
        for _ in 0...3 {
            NumberArr.append(Int(arc4random_uniform(limit)) + level)
        }
        
        return NumberArr
    }
    
    static func questionVerification(numberArr:[Int], signArr:[Int]) -> Bool {
 
        var questionArr = [numberArr[0], signArr[0],
                           numberArr[1], signArr[1],
                           numberArr[2], signArr[2],
                           numberArr[3]]
        
        var end = false
        while !end {
            var existSign = false
            for i in 0...questionArr.count - 1 {
                if i % 2 == 1 {
                    print("* i :: \(i) = \(questionArr[i])")
                    if questionArr[i] == 42 || questionArr[i] == 47 {
                        
                        let calNumber = cal(left: questionArr[i - 1], mid: questionArr[i], right: questionArr[i + 1])
                        if questionArr[i] == 47 && calNumber == 0 {
                            return false
                        }
                        questionArr.remove(at: i + 1)
                        questionArr.remove(at: i)
                        questionArr.remove(at: i - 1)
                        
                        questionArr.insert(calNumber, at: i - 1)
                        
                        existSign = true;
                        break
                    }
                }
            }
            end = !existSign
        }
        return true
    }
    
    
    static func cal(left: Int, mid: Int, right: Int) -> Int {
        switch mid{
        case 43:
            return left + right
        case 45:
            return left - right
        case 42:
            return left * right
        case 47:
            return left / right
        default:
            return 0
        }
    }
    
    
    static func calcurate(numberArr:[Int], signArr:[Int], sign1:Int, sign2:Int) -> [Int]{
        
        var questionArr = [numberArr[0], signArr[0],
                           numberArr[1], signArr[1],
                           numberArr[2], signArr[2],
                           numberArr[3]]
        
        var end = false
        while !end {
            var existSign = false
            for i in 0...questionArr.count - 1 {
                if i % 2 == 1 {
                    print("* i :: \(i) = \(questionArr[i])")
                    if questionArr[i] == sign1 || questionArr[i] == sign2 {
                        
                        let calNumber = MathUtil.cal(left: questionArr[i - 1], mid: questionArr[i], right: questionArr[i + 1])
                        
                        questionArr.remove(at: i + 1)
                        questionArr.remove(at: i)
                        questionArr.remove(at: i - 1)
                        
                        questionArr.insert(calNumber, at: i - 1)
                        
                        existSign = true;
                        break
                    }
                }
            }
            end = !existSign
        }
        return questionArr
    }
    
}
