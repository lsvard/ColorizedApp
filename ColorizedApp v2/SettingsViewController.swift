//
//  ViewController.swift
//  ColorizedApp v2
//
//  Created by l.s.vard on 12.08.2023.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var colorView: UIView!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var viewColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = viewColor
        
        setValue(for: redSlider, greenSlider, blueSlider)
        setValue(for: redLabel, greenLabel, blueLabel)
        setValue(for: redTextField, greenTextField, blueTextField)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonPressed() {
        dismiss(animated: true)
        delegate.setNewValue(for: colorView.backgroundColor ?? .clear)
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        switch sender {
        case redSlider:
            setValue(for: redTextField)
            setValue(for: redLabel)
        case greenSlider:
            setValue(for: greenTextField)
            setValue(for: greenLabel)
        default:
            setValue(for: blueTextField)
            setValue(for: blueLabel)
        }
        
        setColor()
    }
    
    // MARK: - Private Methods
    private func setValue(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case redLabel:
                label.text = string(from: redSlider)
            case greenLabel:
                label.text = string(from: greenSlider)
            default:
                label.text = string(from: blueSlider)
            }
        }
    }
    
    private func setValue(for colorSliders: UISlider...) {
        let ciColor = CIColor(color: viewColor)
        colorSliders.forEach { slider in
            switch slider {
            case redSlider:
                redSlider.value = Float(ciColor.red)
            case greenSlider:
                greenSlider.value = Float(ciColor.green)
            default:
                blueSlider.value = Float(ciColor.blue)
            }
        }
    }
    
    private func setValue(for textFields: UITextField...) {
        textFields.forEach { textField in
            switch textField {
            case redTextField:
                textField.text = string(from: redSlider)
            case greenTextField:
                textField.text = string(from: greenSlider)
            default:
                textField.text = string(from: blueSlider)
            }
        }
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2F", slider.value)
    }
}


// MARK: - UITextFieldDelegate

