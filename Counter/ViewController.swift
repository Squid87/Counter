//
//  ViewController.swift
//  Counter
//
//  Created by Илья Тананыхин on 15.03.2023.
//

import UIKit
let now = Date()
let flags = NSCalendar.Unit(rawValue: UInt.max)
let components = (Calendar.current as NSCalendar).components(flags, from: now)

class ViewController: UIViewController {

    //переменная для хранения роезультата
    var increae: Int = 0
    
    //Вывод результата
    @IBOutlet weak var resultLable: UILabel!
    
    @IBOutlet weak var plusButtun: UIButton!
    @IBOutlet weak var minesButton: UIButton!
    
    
    //Вьющка для хранения истории
    @IBOutlet weak var historytextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //блокирование ввода в поле с клавиатуры
        historytextView.isEditable = false
        // Do any additional setup after loading the view.
        resultLable.text = "Значение счетчика: \(increae)"
        historytextView.text = "История изменений: \n"
        
        //закругление кнопок
        plusButtun.layer.cornerRadius = 10
        plusButtun.clipsToBounds = true
        minesButton.layer.cornerRadius = 10
        minesButton.clipsToBounds = true
        
        
    }
    
    //Функция увеличения счетчика
    @IBAction func increaseBitton(_ sender: Any) {
        increae = increae+1
        resultLable.text = "Значение счетчика: \(increae)"
        
        //«[дата и время]: значение увеличено»
        historytextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение изменено на +1 \n")
    }
    
    
    //Функция уменьшение счетсика
    @IBAction func decreaseButton(_ sender: Any) {
        if increae != 0 {
            increae = increae-1
            resultLable.text = "Значение счетчика: \(increae)"
            //«[дата и время]: значение уменьшено»
            historytextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение изменено на -1 \n")
        }
        //«[дата и время]: попытка уменьшить значение счётчика ниже 0»
        else{
            historytextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)],попытка уменьшить значение счётчика ниже 0 \n")
        }
        
    }
    
    //Функция обнуление счетчика
    @IBAction func resetCounter(_ sender: Any) {
        
        increae = 0
        resultLable.text = "Значение счетчика: \(increae)"
        //«[дата и время]: значение сброшено»
        historytextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение сброшено \n")
    }
    
    
}

