import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            // Check if password is at least 6 characters long
            if password.count < 6 {
                let alert = UIAlertController(title: "Password Too Short", 
                                            message: "Password must be at least 6 characters long.", 
                                            preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                present(alert, animated: true, completion: nil)
                return
            }
            
            // Add loading indicator
            sender.isEnabled = false
            sender.setTitle("Registering...", for: .disabled)
            
            print("Attempting to register with email: \(email)")
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                DispatchQueue.main.async {
                    // Re-enable button
                    sender.isEnabled = true
                    sender.setTitle("Register", for: .normal)
                    
                    if let e = error {
                        print("Registration error: \(e)")
                        // Show error to user
                        let alert = UIAlertController(title: "Registration Error", 
                                                    message: e.localizedDescription, 
                                                    preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        print("Registration successful, navigating to chat")
                        //Navigate to the ChatViewController
                        self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    }
                }
            }
        }
    }
            
}
