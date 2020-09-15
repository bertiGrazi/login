//
//  ViewController.swift
//  login
//
//  Created by Grazi Berti on 15/09/20.
//  Copyright © 2020 Grazi Berti. All rights reserved.
//

import UIKit

//class Cadastro {
//    var email: String
//    var senha: String
//
//    init(email: String, senha: String){
//        self.email = email
//        self.senha = senha
//    }
//}
//class ValidacaoEmail {
//    var cadastro = [Cadastro]()
//
//    private func validaEmail(email: String, senha: String){
//        if !cadastrou(email: email){
//            self.adicionaEmail(email: email, senha: senha)
//            print("Cadastro com sucesso")
//        } else {
//            print("Usuário cadastrado")
//        }
//    }
//    private func adicionaEmail(email: String, senha: String){
//        var cadastrar = Cadastro(email: email, senha: senha)
//        self.cadastro.append(cadastrar)
//    }
//    func cadastrou(email: String) -> Bool {
//        for index in self.cadastro {
//            if index.email == email {
//                return true
//                break
//            }
//        }
//        return false
//    }
//}

class ViewController: UIViewController {
// IBOutlet para o textField
    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldSenha: UITextField!
// IBOutlet para o button
    @IBOutlet weak var buttonCadastrar: UIButton!
    
    @IBAction func buttonActionCadastrar(_ sender: Any) {
        textFieldEmail.text = ""
        textFieldSenha.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textFieldEmail.delegate = self
        textFieldSenha.delegate = self
        
        //escondendo a senha
        textFieldSenha.isSecureTextEntry = true
        
      
    }
    
    private func validaInformacoes() -> Bool {
        if textFieldEmail.text == nil || textFieldEmail.text!.isEmpty {
            print("Por favor, insira seu e-mail")
            
            // Comeca alerta
                       let alert = UIAlertController(title: "Atenção", message: "Falta inserir o e-mail", preferredStyle: .alert)

                       let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
                       }
                       alert.addAction(okAction)
                       self.present(alert, animated: true) {
                          
                       }
            // Termina alerta
        return false
        }
        if textFieldSenha.text == nil || textFieldSenha.text!.isEmpty {
         print("Por favor, insira sua senha")
            // Comeca alerta
            let alert = UIAlertController(title: "Atenção", message: "Falta inserir sua senha", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OK", style: .cancel) { (UIAlertAction) in
            }
            alert.addAction(okAction)
            self.present(alert, animated: true) {
               
            }
            // Termina alerta
        return false
        }
        return true
    }
    
}
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == textFieldEmail{
            textFieldSenha.becomeFirstResponder()
        } else {
            if validaInformacoes(){
                textField.resignFirstResponder()
            }
          }
        return true
    }
    
    
}


