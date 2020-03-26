//
//  ViewController.swift
//  IMCSwift
//
//  Created by Rafaela on 26/03/20.
//  Copyright © 2020 Rafaela. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfweight: UITextField!
    @IBOutlet weak var tfheight: UITextField!
    @IBOutlet weak var lbresult: UILabel!
    @IBOutlet weak var ivresult: UIImageView!
    @IBOutlet weak var viresult: UIView!
    
    var imc: Double = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    @IBAction func calculate(_ sender: Any) {
        if let weight = Double(tfweight.text!), let height = Double(tfheight.text!) {
            imc = weight / pow(height, 2)
            showResults()
        }
    }
    
    func showResults () {
        var result: String = " "
        var image: String = " "
        switch imc {
            case 0..<16:
                result = "Magreza"
                image = "abaixo"
            case 16..<18.5:
                result = "Abaixo do peso"
                image = "abaixo"
            case 18.5..<25:
                result = "Peso ideal"
                image = "ideal"
            case 25..<30:
                result = "Sobrepeso"
                image = "sobre"
            default:
                result = "Obesidade"
                image = "obesidade"
        }
        lbresult.text = "\(Int(imc)): \(result)"
        ivresult.image = UIImage(named: image)
        viresult.isHidden = false
        view.endEditing(true)
    }
    
}

