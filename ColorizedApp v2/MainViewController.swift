//
//  ViewController.swift
//  ColorizedApp v2
//
//  Created by lsvard on 05.09.2023.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    func setNewValue(for viewColor: UIColor)
}

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.delegate = self
        settingsVC.viewColor = view.backgroundColor
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewValue(for viewColor: UIColor) {
        view.backgroundColor = viewColor
    }
}
