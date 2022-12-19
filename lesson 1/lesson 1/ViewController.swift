//
//  ViewController.swift
//  lesson
//
//  Created by Lashaun Corinna on 12/7/22.
//

import UIKit

class ViewController: UIViewController {
    
    var uiElements = ["UISegmentedControl",
                      "UILabel",
                      "UISlider",
                      "UITextField",
                      "UIDatePicker",
                      "UIButton"]
    
    var selectedElement: String?
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var switchLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var name: [String] = UIFont.familyNames
//        print(name)
        
        slider.value = 1
        label.text = String(slider.value)
        label.font = label.font.withSize(20)
        label.textAlignment = .center
        label.numberOfLines = 2
        
        segmentControl.insertSegment(withTitle: "Third", at: 2, animated: true)
        segmentControl.backgroundColor = .white
        segmentControl.selectedSegmentTintColor = .red
        
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .green
        slider.maximumTrackTintColor = .yellow
        
        dataPicker.locale = Locale(identifier: "ru_RU")
        
        choiceUIElement()
    }
    
    func hidenAllElements() {
        segmentControl.isHidden = true
        label.isHidden = true
        slider.isHidden = true
        doneButton.isHidden = true
        dataPicker.isHidden = true
        textField.isHidden = true
    }
    
    func showAllElements() {
        segmentControl.isHidden = false
        label.isHidden = false
        slider.isHidden = false
        doneButton.isHidden = false
        dataPicker.isHidden = false
        textField.isHidden = false
    }
    
    func    choiceUIElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        textField.inputView = elementPicker
        createToolsBar()
        //costamization
        elementPicker.backgroundColor = .yellow
    }
    
    func createToolsBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Hide", style: .plain, target: self, action: #selector(dismissKeyboard))
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        textField.inputAccessoryView = toolBar
        //costamization
        toolBar.tintColor = .brown
        toolBar.barTintColor = .green
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func action(_ sender: UISegmentedControl) {
        label.isHidden = false
        switch segmentControl.selectedSegmentIndex {
        case 0:
            label.text = "1"
        case 1:
            label.text = "2"
        case 2:
            label.text = "3"
        default:
            print("I  have problem")
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        label.textColor = .white
        label.text = String(slider.value)
        
        let back = self.view.backgroundColor
        self.view.backgroundColor = back?.withAlphaComponent(CGFloat(sender.value))
    }
    
    private func containsNumbers(str: String) -> Bool{
        for char in str {
            if char.isNumber {
                return true
            }
        }
        return false
    }
    
    @IBAction func buttonDone(_ sender: UIButton) {
        guard textField.text?.isEmpty == false else { return }
        if containsNumbers(str: textField.text!) {
            let alert = UIAlertController(title: "My", message: "invalid input format", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "Yes", style: .default, handler: nil)
            alert.addAction(UIAlertAction(title: "NO", style: .destructive, handler: { _ in NSLog("123" )}))
            alert.addAction(alertAction )
            self.present(alert, animated: true)
        } else {
            label.text = textField.text
            textField.text = nil
        }
    }
    @IBAction func changeDate(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        let dateValue = dateFormatter.string(from: sender.date)
        label.text = dateValue
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if sender.isOn {
            switchLabel.text = "Отобразить все элементы"
            hidenAllElements()
        } else {
            showAllElements()
            switchLabel.text = "Скрыть все элементы"
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedElement = uiElements[row]
        textField.text = selectedElement
        hidenAllElements()
        textField.isHidden = false
        switch textField.text {
        case "UISegmentedControl":
            segmentControl.isHidden = false
        case "UILabel":
            label.isHidden = false
        case "UISlider":
            slider.isHidden = false
        case "UIDatePicker":
            dataPicker.isHidden = false
        case "UIButton":
            doneButton.isHidden = false
        default:
            textField.isHidden = false
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerViewLabel = UILabel()
        if let currentLabel = view as? UILabel {
            pickerViewLabel = currentLabel
        }
        
        pickerViewLabel.textColor = .blue
        pickerViewLabel.textAlignment = .right
        pickerViewLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        pickerViewLabel.text = uiElements[row]
        return pickerViewLabel
    }
}
