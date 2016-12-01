// ProfileViewController.swift
// Auth0Sample
//
// Copyright (c) 2016 Auth0 (http://auth0.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

import UIKit
import Lock

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var profile: A0UserProfile!
    var token: A0Token!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.welcomeLabel.text = "Welcome, \(self.profile.name)"
<<<<<<< Updated upstream
        URLSession.shared.dataTask(with: self.profile.picture, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                guard let data = data , error == nil else { return }
=======
        URLSession.sharedSession.dataTaskWithURL(self.profile.picture, completionHandler: { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else { return }
>>>>>>> Stashed changes
                self.avatarImageView.image = UIImage(data: data)
            }
        }).resume()
        
        submitLogin(self.token.accessToken!)
    }

    func submitLogin(_ accessToken: String) {
        let url = URL(string: "http://10.11.7.128/api/v2/authenticate")!
        let request = NSMutableURLRequest(url: url);
        request.httpMethod = "POST";
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(accessToken, forHTTPHeaderField: "Access-Token")
        
        
        request.httpBody = "".data(using: String.Encoding.utf8);
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let response = response, let data = data {
                print(response)
                print(String(data: data, encoding: String.Encoding.utf8))
                
                DispatchQueue.main.sync{
                    
                    // let mainViewController = self.storyboard?.instantiateViewControllerWithIdentifier("MainController") as? MainViewController
                    // mainViewController?.infoText = String(data: data, encoding: NSUTF8StringEncoding)
                    // self.presentViewController(mainViewController!, animated: true, completion: nil)
                }
                
            } else {
                print("Error: \(error)")
            }
        }) 
        
        task.resume()
    }
}
