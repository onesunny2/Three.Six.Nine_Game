//
//  ViewController.swift
//  Three.Six.Nine_Game
//
//  Created by Lee Wonsun on 1/8/25.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, ThreeSixNineGame {
    
    @IBOutlet var textfield: UITextField!
    @IBOutlet var resultTextView: UITextView!
    @IBOutlet var countingLabel: UILabel!
    
    let pickerView = UIPickerView()  // 코드베이스로 추가하기 위함
    
    var gameNum: [String]  = []
    var newGameNum:[String] = []
    var clapCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textfield.delegate = self
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        textfieldView()
        resultView()
        countingView()
        
        
        for num in 1...777 {
            gameNum.append(String(num))
        }
    }
    
    func resultView() {
        resultTextView.isEditable = false
        resultTextView.text = ""
        resultTextView.textColor = .lightGray
        resultTextView.font = .systemFont(ofSize: 24, weight: .medium)
    }
    
    func textfieldView() {
        textfield.inputView = pickerView
        textfield.placeholder = "최대 숫자를 골라주세요"
        textfield.borderStyle = .line
    }
    
    func countingView() {
        countingLabel.textAlignment = .center
        countingLabel.numberOfLines = 0
        countingLabel.font = .systemFont(ofSize: 36, weight: .bold)
        countingLabel.text = "숫자를 골라주세요 :>"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 777
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return gameNum.reversed()[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        changeToClap(row)
        
        let result = newGameNum.joined(separator: ", ")
        
        resultTextView.text = result
        countingLabel.text = "숫자 777까지 총 박수는 \(clapCount)번 입니다."
        
    }
    
    func changeToClap(_ row: Int) {
        clapCount = 0  // 초기화
        
        for index in 1...(777 - row) {
            var stringNum = String(index)
            if stringNum.contains("3") || stringNum.contains("6") || stringNum.contains("9") {
//                stringNum = "👏🏻"
                stringNum.replaceClap()
                clapCount += stringNum.filter { $0 == "👏🏻" }.count
            }
            newGameNum.append(stringNum)
        }
    }

    @IBAction func tapViewGesture(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
}

extension String {
    
    mutating func replaceClap() {
        self = self.replacingOccurrences(of: "3", with: "👏🏻")
        self = self.replacingOccurrences(of: "6", with: "👏🏻")
        self = self.replacingOccurrences(of: "9", with: "👏🏻")
    }
}
