//
//  ViewController.swift
//  Counter
//
//  Created by Илья Тананыхин on 15.03.2023.
//

import UIKit

private let now = Date()
private let flags = NSCalendar.Unit(rawValue: UInt.max)
private let components = (Calendar.current as NSCalendar).components(flags, from: now)

class ViewController: UIViewController {

    //переменная для хранения роезультата
    private var increase: Int = 0
    
    //Вывод результата
    @IBOutlet weak private var resultLabel: UILabel!
    
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minesButton: UIButton!
    
    
    //Вьющка для хранения истории
    @IBOutlet weak private var HistoryTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //блокирование ввода в поле с клавиатуры
        HistoryTextView.isEditable = false
        // Do any additional setup after loading the view.
        resultLabel.text = "Значение счетчика: \(increase)"
        HistoryTextView.text = "История изменений: \n"
        
        //закругление кнопок
        plusButton.layer.cornerRadius = 10
        plusButton.clipsToBounds = true
        minesButton.layer.cornerRadius = 10
        minesButton.clipsToBounds = true
        
        
    }
    
    //Функция увеличения счетчика
    @IBAction func increaseButton(_ sender: Any) {
        increase = increase+1
        resultLabel.text = "Значение счетчика: \(increase)"
        
        //«[дата и время]: значение увеличено»
        HistoryTextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение изменено на +1 \n")
    }
    
    
    //Функция уменьшение счетчика
    @IBAction func decreaseButton(_ sender: Any) {
        if increase != 0 {
            increase = increase-1
            resultLabel.text = "Значение счетчика: \(increase)"
            //«[дата и время]: значение уменьшено»
            HistoryTextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение изменено на -1 \n")
        }
        //«[дата и время]: попытка уменьшить значение счётчика ниже 0»
        else{
            HistoryTextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)],попытка уменьшить значение счётчика ниже 0 \n")
        }
        
    }
    
    //Функция обнуление счетчика
    @IBAction func resetCounter(_ sender: Any) {
        
        increase = 0
        resultLabel.text = "Значение счетчика: \(increase)"
        //«[дата и время]: значение сброшено»
        HistoryTextView.text.append("[\(components.day!).\(components.month!).\(components.year!)], \(components.hour!):\(components.minute!)], значение сброшено \n")
    }
    
    
}

