 //
//  ViewController.swift
//  lesson 2
//
//  Created by Lashaun Corinna on 12/12/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textView.delegate = self
        
        textView.isHidden = true
//        textView.alpha = 0

        textView.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 20)
        textView.backgroundColor = self.view.backgroundColor
        textView.text = "Placeholder"
        textView.textColor = UIColor.gray
        
        textView.layer.cornerRadius = 10
        
        stepper.value = 20
        stepper.minimumValue = 10
        stepper.maximumValue = 30
        
        stepper.tintColor = .white
        stepper.backgroundColor = .gray
        stepper.layer.cornerRadius = 5
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .red
        activityIndicator.startAnimating()
        
        progressView.setProgress(0, animated: true)
        self.view.isUserInteractionEnabled = false
        
        //tracking the appearance of the keyboard
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                                object: nil)
        //watch the keyboard hide
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(updateTextView(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)

//        UIView.animate(withDuration: 0,
//                       delay: 3,
//                       options: .allowAnimatedContent,
//                       animations: { self.textView.alpha = 1 }) { (finished) in
//            self.activityIndicator.stopAnimating();
//            self.textView.isHidden = false
//            UIApplication.shared.endIgnoringInteractionEvents()
//        }
        
        Timer.scheduledTimer(withTimeInterval: 0, repeats: true) { _ in
            if self.progressView.progress != 1 {
                self.progressView.progress += 0.2
                sleep(1) //artificial delay for loading the screen
            } else {
                self.activityIndicator.stopAnimating();
                self.textView.isHidden = false
                self.view.isUserInteractionEnabled = true
                self.progressView.isHidden = true
            }
        }
    }
    
    @objc func updateTextView(notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: AnyObject],
              let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        if notification.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height - bottomConstraint.constant, right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
        
    }

    //hide the keyboard after clicking on the view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true) //hide the keyboard called for any object
//        textView.resignFirstResponder() //hide the keyboard called for a specific object
    }
    @IBAction func sizeFont(_ sender: UIStepper) {
        let font = textView.font?.fontName
        let fontSize = CGFloat(sender.value)
        
        textView.font = UIFont(name: font!, size: fontSize)
    }
    
}

extension ViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.gray {
            textView.text = nil
        }
        textView.backgroundColor = .white
        textView.textColor = .blue
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.backgroundColor = self.view.backgroundColor
        textView.textColor = .black
        if textView.text.isEmpty {
                textView.text = "Placeholder"
                textView.textColor = UIColor.gray
            }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        countLabel.text = "\(textView.text.count)"
        return textView.text.count + (text.count - range.length) <= 140
    }
}
