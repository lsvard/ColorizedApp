//
//  ViewController.swift
//  ColorizedApp v2
//
//  Created by lsvard on 05.09.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.viewBackgroundColor = view.backgroundColor
    }

}
