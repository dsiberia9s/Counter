//
//  ViewController.swift
//  Counter
//
//  Created by Dmitrii on 15.04.2023.
//

import UIKit

class ViewController: UIViewController {

    var counter: Int = 0
    
    @IBOutlet weak var historyUITextView: UITextView!
    @IBOutlet weak var countUILabel: UILabel!
    
    @IBAction func plusUIButton(_ sender: Any) {
        counter += 1
        log(message: "значение изменено на +1")
    }
    
    @IBAction func minusUIButton(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            log(message: "значение изменено на -1")
        } else {
            log(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func resetUIButton(_ sender: Any) {
        counter = 0
        log(message: "значение сброшено")
    }
    
    func log(message: String) {
        let date = Date()
        let format = DateFormatter()
        format.dateStyle = .short
        format.timeStyle = .medium
        
        countUILabel.text = "Значение счётчика: \(counter)"
        
        historyUITextView.text += "[\(format.string(from: date))]: \(message).\n"
        
        let range = NSMakeRange(historyUITextView.text.count - 1, 0)
        historyUITextView.scrollRangeToVisible(range)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.        
        historyUITextView.text += "\n"
        
        print("Welcome!")
    }


}

