//
//  ViewController.swift
//  Quizz
//
//  Created by mac17 on 07/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPregunta: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var numPregunta=0
    let preguntas=[
        ["Hola como estas?","VERDADERO"],
        ["Como te llamas?","FALSO"],
        ["Hoy hay clase?","VERDADERO"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        lblPregunta.text="Porque no me ama?"
    }

   
    
    @IBAction func btnAnswer(_ sender: UIButton) {
        //print("Boton presionado: \(sender.currentTitle)")
        let answerUser = sender.currentTitle
        
        if numPregunta < preguntas.count{
            lblPregunta.text=preguntas[numPregunta][0]
            numPregunta += 1
        }else{
            numPregunta=0
        }
    }
    
}

