//
//  CreateVC.swift
//  AmongUs
//
//  Created by HHumorous on 11/11/2020.
//

import UIKit

class CreateVC: BaseVC {
    
    enum CreateComponent: Int, CaseIterable {
        case Character = 0
        case Text
        case Background
        case Boder
        
        var title: String {
            switch self {
            case .Background:
                return "BACKGROUND"
            case .Boder:
                return "BORDER"
            case .Character:
                return "CHARACTER"
            case .Text:
                return "TEXT & FONT"
            }
        }
    }
    
    @IBOutlet weak var vPicker: AKPickerView!
    @IBOutlet weak var clvContent: UICollectionView!
    @IBOutlet weak var btnPreview: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupPickerView()
    }
    
    func setupPickerView() {
        vPicker.delegate = self
        vPicker.dataSource = self
        vPicker.interitemSpacing = 25.0
    }
    
    func setupCollectionView() {
        
    }
    
    @IBAction func onPressBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension CreateVC: AKPickerViewDataSource, AKPickerViewDelegate {
    func numberOfItemsInPickerView(_ pickerView: AKPickerView) -> Int {
        return CreateComponent.allCases.count
    }
    
    func pickerView(_ pickerView: AKPickerView, titleForItem item: Int) -> String {
        return CreateComponent.allCases[item].title
    }
    
    func pickerView(_ pickerView: AKPickerView, didSelectItem item: Int) {
        
        UIView.performWithoutAnimation {
            self.vPicker.reloadData()
        }
        
//        clvContent.reloadData()
    }
}
