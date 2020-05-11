//
//  ViewController.swift
//  CarNumberMath
//
//  Created by Jin Won Kim on 2020/05/08.
//  Copyright © 2020 Jin Won Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var myLbl: UILabel!
    @IBOutlet weak var answerLbl: UILabel!
    
    @IBOutlet weak var resultLbl: UILabel!
    
    @IBOutlet weak var num1Lbl: UILabel!
    @IBOutlet weak var num2Lbl: UILabel!
    @IBOutlet weak var num3Lbl: UILabel!
    @IBOutlet weak var num4Lbl: UILabel!
    
    @IBOutlet weak var sign1Lbl: UILabel!
    @IBOutlet weak var sign2Lbl: UILabel!
    @IBOutlet weak var sign3Lbl: UILabel!
    
    
//    var questionArr:[Int] = []
    var numberArr:[Int] = []
    var signArr:[Int] = []
    
    
    var anwerSignArr:[Int] = []
    
    var answerNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        makeQuiz()
    }
    
    func makeQuiz() {
        
        makeQuestion()
        answerNumber = questionCal(numberArr: numberArr, signArr: signArr)
        answerLbl.text = "\(answerNumber)"
    }
    
    
    
    
    
    func makeQuestion() {
         
        numberArr = []
        signArr = []
        
        numberArr = MathUtil.makeNumberArr(level: 1)
        signArr = MathUtil.makeSignArr()
        myLbl.text = "\(MathUtil.transformSign(i: signArr[0])), \(MathUtil.transformSign(i: signArr[1])), \(MathUtil.transformSign(i: signArr[2]))"
        num1Lbl.text = "\(numberArr[0])"
        num2Lbl.text = "\(numberArr[1])"
        num3Lbl.text = "\(numberArr[2])"
        num4Lbl.text = "\(numberArr[3])"
         
        
//        questionArr = [numberArr[0], calSignArr[0],
//                       numberArr[1], calSignArr[1],
//                       numberArr[2], calSignArr[2],
//                       numberArr[3]]
        
        if !MathUtil.questionVerification(numberArr: numberArr, signArr:signArr) {
            makeQuestion()
        }
    }
    
    func questionCal(numberArr:[Int], signArr:[Int]) -> Int {
        
        var questionArr:[Int] = []
        
        questionArr = MathUtil.calcurate(numberArr: numberArr, signArr:signArr, sign1: 42, sign2: 47)
        questionArr = MathUtil.calcurate(numberArr: numberArr, signArr:signArr, sign1: 43, sign2: 45)
        
        return questionArr[0]
    }
    
    func insertAnser() {
        if anwerSignArr.count == 0 {
            sign1Lbl.text = ""
            sign2Lbl.text = ""
            sign3Lbl.text = ""
        }
        if anwerSignArr.count > 0 {
            sign1Lbl.text = MathUtil.transformSign(i:anwerSignArr[0])
        }
        if anwerSignArr.count > 1 {
            sign2Lbl.text = MathUtil.transformSign(i:anwerSignArr[1])
        }
        if anwerSignArr.count > 2 {
            sign3Lbl.text = MathUtil.transformSign(i:anwerSignArr[2])
        }
    }
    
    
    @IBAction func signAction(_ sender: UIButton) {
        let tag = sender.tag
        print("tag :: \(tag)")
        if tag == 0 {
            anwerSignArr.append(43)
        } else if tag == 1 {
            anwerSignArr.append(45)
        } else if tag == 2 {
            anwerSignArr.append(42)
        } else if tag == 3 {
            anwerSignArr.append(47)
        }
        insertAnser()
    }
    
    @IBAction func initAction(_ sender: Any) {
        anwerSignArr = []
        insertAnser()
        resultLbl.text  = "정답은?"
    }
    
    @IBAction func newQuestionAction(_ sender: Any) {
        makeQuiz()
        resultLbl.text  = "정답은?"
    }
    @IBAction func sumitAction(_ sender: Any) {
        
        if answerNumber == questionCal(numberArr: numberArr, signArr: anwerSignArr) {
            resultLbl.text = "정답!! \(answerNumber)"
        } else {
            resultLbl.text = "땡!!"
        }
        
    }
    
}

