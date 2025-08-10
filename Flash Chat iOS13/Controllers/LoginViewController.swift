import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            // Add loading indicator or disable button to show something is happening
            sender.isEnabled = false
            sender.setTitle("Logging in...", for: .disabled)
            
            print("Attempting to login with email: \(email)")
            
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                DispatchQueue.main.async {
                    // Re-enable the button
                    sender.isEnabled = true
                    sender.setTitle("Log In", for: .normal)
                    
                    if let e = error {
                        print("Login error: \(e)")
                        // Show error to user
                        let alert = UIAlertController(title: "Login Error", 
                                                    message: e.localizedDescription, 
                                                    preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    } else {
                        print("Login successful, navigating to chat...")
                        //Navigate to the ChatViewController
                        self.performSegue(withIdentifier: K.loginSegue, sender: self)
                    }
                }
            }
        } else {
            // Show error if email or password is empty
            let alert = UIAlertController(title: "Missing Information", 
                                        message: "Please enter both email and password.", 
                                        preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}
