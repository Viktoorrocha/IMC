//
//  ViewController.swift
//  IMC
//
//  Created by Viktor Rocha on 23/09/2018.
//  Copyright © 2018 Viktor Rocha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfPeso: UITextField!
    @IBOutlet weak var tfAltura: UITextField!
    @IBOutlet weak var lbResultado: UILabel!
    @IBOutlet weak var ivResultado: UIImageView!
    @IBOutlet weak var viResult: UIView!
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBAction func calculate(_ sender: Any) {
        
        if let weight = Double(tfPeso.text!), let height = Double(tfAltura.text!) {
            imc = weight / pow(height, 2)
            showResults()
        }
        
    }
    
    func showResults(){
        var result: String = ""
        var image: String = ""
        
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
        
        lbResultado.text = "\(Int(imc))): \(result)"
        ivResultado.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    

}

