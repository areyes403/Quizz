

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblPregunta: UILabel!
    @IBOutlet weak var btnTrue: UIButton!
    @IBOutlet weak var btnFalse: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    var numPregunta=0
    @IBOutlet weak var lblPuntuaje: UILabel!
    var puntuaje=0
    var bar=0.1 as Float
    let alert = UIAlertController(title: "Juego Finalizado", message: "Desea jugar otra ves?", preferredStyle: UIAlertController.Style.alert)
    
    /*
    let preguntas=[
        ["Hola como estas?","VERDADERO"],
        ["Como te llamas?","FALSO"],
        ["Hoy hay clase?","VERDADERO"]
    ]*/
    
    let preguntas=[
        Pregunta(t: "Xiaomi es el mejor kalida-prezio", r: "VERDADERO"),
        Pregunta(t: "Ella te ama?", r: "FALSO"),
        Pregunta(t: "Si pero el pri robo mas", r: "VERDADERO"),
        Pregunta(t: "La raiz de 4 es 2", r: "VERDADERO"),
        Pregunta(t: "Mexico es potencia mundial", r: "FALSO"),
        Pregunta(t: "Morelia ha sido campeon 3 veces en la liga MX", r: "FALSO"),
        Pregunta(t: "La tierra es el planeta mas grande del sistema solar", r: "FALSO"),
        Pregunta(t: "Los reyes magos traen regalos a los niños", r: "VERDADERO"),
        Pregunta(t: "Android es el mejor procesador del mercado", r: "FALSO"),
        Pregunta(t: "Microsoft es una de las empresas mas valuadas del mundo", r: "VERDADERO"),
    ]
    
    let progress = Progress (totalUnitCount: 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cambiarPregunta()
        
        alert.addAction(UIAlertAction(title: "Si, jugar de nuevo", style: UIAlertAction.Style.default, handler: { action in

            self.numPregunta =  0
            self.bar = 0.1
            self.puntuaje = 0
            self.cambiarPregunta()
            self.progressBar.setProgress(self.bar, animated: true)
        }))
        
        alert.addAction(UIAlertAction(title: "Salir", style: UIAlertAction.Style.destructive, handler: { action in
            exit(0)
        }))    }

   
    
    @IBAction func btnAnswer(_ sender: UIButton) {
        let answerUser = sender.currentTitle
        let correctAnswer = preguntas[numPregunta].respuesta
        
        if answerUser == correctAnswer{
            //print("Respuesta correcta :v")
            sender.backgroundColor=UIColor.green
            puntuaje += 10
            //print("El puntuaje obtenido: " + String(puntuaje))
            self.lblPuntuaje.text=" Puntuaje obtenido: " + String(puntuaje)
        }else{
            //print("Mal xC")
            sender.backgroundColor=UIColor.red
            
        }
        
        if numPregunta < preguntas.count - 1 {
            numPregunta += 1
            DispatchQueue.main.async {  // To update UI
                self.progressBar.setProgress(self.bar, animated: true)
            }
            bar += 0.1
        }else{
            
            
            alert.message="""
                            Puntuaje obtenido \(self.puntuaje)
                            Desea jugar otra vez?
                            """
            
            self.present(alert, animated: true, completion: nil)
            
            
        }
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
    }

    
    @objc func cambiarPregunta(){
        lblPregunta.text = preguntas[numPregunta].texto
        btnTrue.backgroundColor=UIColor.white
        btnFalse.backgroundColor=UIColor.white
        
    }

}

