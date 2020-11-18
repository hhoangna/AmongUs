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
    
    enum TextRow: Int, CaseIterable {
        case Font = 0
        case Size
        case Color
    }
    
    enum BorderRow: Int, CaseIterable {
        case Color = 0
        case Size
    }
    
    @IBOutlet weak var vPicker: AKPickerView!
    @IBOutlet weak var clvContent: UICollectionView!
    @IBOutlet weak var btnPreview: UIButton!
    
    var selectedComponent: CreateComponent = .Character
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupPickerView()
        setupCollectionView()
    }
    
    func setupPickerView() {
        vPicker.delegate = self
        vPicker.dataSource = self
        vPicker.interitemSpacing = 35.0
        vPicker.selectItem(selectedComponent.rawValue, animated: true)
    }
    
    func setupCollectionView() {
        clvContent.delegate = self
        clvContent.dataSource = self
        clvContent.register(UINib(nibName: CreateCharaterCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: CreateCharaterCell.identifierCell)
        clvContent.register(UINib(nibName: CreateTextSizeCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: CreateTextSizeCell.identifierCell)
        clvContent.register(UINib(nibName: CreateTextFontCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: CreateTextFontCell.identifierCell)
        clvContent.register(UINib(nibName: CreateTextColorCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: CreateTextColorCell.identifierCell)
        clvContent.register(UINib(nibName: CreateBorderSizeCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: CreateBorderSizeCell.identifierCell)
        clvContent.register(UINib(nibName: CreateLineCell.identifierCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CreateLineCell.identifierCell)
        clvContent.register(UINib(nibName: CreateLineCell.identifierCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CreateLineCell.identifierCell)
        clvContent.register(UINib(nibName: CreateBorderHeaderCell.identifierCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CreateBorderHeaderCell.identifierCell)

        clvContent.collectionViewLayout = createLayout(component: selectedComponent)
    }
    
    func createLayout(component: CreateComponent) -> UICollectionViewLayout {
        let sectionProvider = {(sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
                                    
            let section: NSCollectionLayoutSection
            
            switch component {
            case .Character, .Background:
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(130), heightDimension: .absolute(130))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemGroup])
                group.interItemSpacing = .fixed(16)
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.orthogonalScrollingBehavior = .continuous
                section.contentInsets = NSDirectionalEdgeInsets(top: 15, leading: 16, bottom: 20, trailing: 16)
            case .Text:
                guard let sectionKind = TextRow(rawValue: sectionIndex) else { return nil }
                switch sectionKind {
                case .Font:
                    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(32))
                    let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                    itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                    let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(32))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemGroup])
                    section = NSCollectionLayoutSection(group: group)
                    section.interGroupSpacing = 16
                    section.orthogonalScrollingBehavior = .continuous
                    section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 16, bottom: 0, trailing: 16)
                case .Size:                    
                    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                    itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(51))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 1)
                    
                    section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    
                    let headerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                          heightDimension: .estimated(1))
                    let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    
                    let footerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                          heightDimension: .estimated(1))
                    let footerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: footerSize,
                        elementKind: UICollectionView.elementKindSectionFooter,
                        alignment: .bottom)
                    section.boundarySupplementaryItems = [headerSupplementary, footerSupplementary]
                    
                case .Color:
                    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(41))
                    let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                    itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(41), heightDimension: .absolute(41))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemGroup])
                    
                    section = NSCollectionLayoutSection(group: group)
                    section.interGroupSpacing = 12
                    section.orthogonalScrollingBehavior = .continuous
                    section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 12, trailing: 16)
                }
            default:
                guard let sectionKind = BorderRow(rawValue: sectionIndex) else { return nil }
                switch sectionKind {
                case .Color:
                    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(41))
                    let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                    itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

                    let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(41), heightDimension: .absolute(41))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemGroup])
                    
                    section = NSCollectionLayoutSection(group: group)
                    section.interGroupSpacing = 12
                    section.orthogonalScrollingBehavior = .continuous
                    section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 16, bottom: 24, trailing: 16)
                    
                    let headerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                          heightDimension: .estimated(30))
                    let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    section.boundarySupplementaryItems = [headerSupplementary]
                case .Size:
                    let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                    itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(51))
                    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 1)
                    
                    section = NSCollectionLayoutSection(group: group)
                    section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 24, trailing: 0)
                    
                    let headerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                          heightDimension: .estimated(30))
                    let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                        layoutSize: headerSize,
                        elementKind: UICollectionView.elementKindSectionHeader,
                        alignment: .top)
                    section.boundarySupplementaryItems = [headerSupplementary]
                }
            }

            return section
        }
        
        let config = UICollectionViewCompositionalLayoutConfiguration()
        config.interSectionSpacing = 16
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider, configuration: config)
        
        return layout
    }
    
    @IBAction func onPressBack(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func onPressCreate(_ sender: UIButton) {
        let resultView: ResultView = .fromNib()
        resultView.show()
        resultView.callback = { result in
            if !result {
                self.navigationController?.popViewController(animated: true)
            }
        }
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
        selectedComponent = CreateComponent.allCases[item]
        
        UIView.performWithoutAnimation {
            self.vPicker.reloadData()
        }
        
        clvContent.collectionViewLayout = createLayout(component: selectedComponent)
        clvContent.reloadData()
    }
}

extension CreateVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        switch selectedComponent {
        case .Background, .Character:
            return 1
        case .Text:
            return TextRow.allCases.count
        case .Boder:
            return BorderRow.allCases.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch selectedComponent {
        case .Background, .Character:
            return 5
        case .Text:
            let sec = TextRow(rawValue: section)
            switch sec {
            case .Font:
                return 10
            case .Color:
                return 20
            default:
                return 1
            }
        case .Boder:
            let sec = BorderRow(rawValue: section)
            switch sec {
            case .Color:
                return 20
            default:
                return 1
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        switch selectedComponent {
        case .Text:
            if kind == UICollectionView.elementKindSectionHeader {
                let header: CreateLineCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CreateLineCell.identifierCell, for: indexPath) as! CreateLineCell
                
                return header
            } else if kind == UICollectionView.elementKindSectionFooter {
                let header: CreateLineCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CreateLineCell.identifierCell, for: indexPath) as! CreateLineCell
                
                return header
            } else {
                return UICollectionReusableView()
            }
        case .Boder:
            let sec = BorderRow(rawValue: indexPath.section)
            switch sec {
            case .Color:
                let header: CreateBorderHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CreateBorderHeaderCell.identifierCell, for: indexPath) as! CreateBorderHeaderCell
                
                header.lblTitle.text = "COLOR"
                
                return header
            default:
                let header: CreateBorderHeaderCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CreateBorderHeaderCell.identifierCell, for: indexPath) as! CreateBorderHeaderCell
                
                header.lblTitle.text = "BORDER SIZE"
                
                return header
            }
        default:
            return UICollectionReusableView()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch selectedComponent {
        case .Background, .Character:
            let cell: CreateCharaterCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateCharaterCell.identifierCell, for: indexPath) as! CreateCharaterCell
            
            return cell
        case .Text:
            let sec = TextRow(rawValue: indexPath.section)
            switch sec {
            case .Font:
                let cell: CreateTextFontCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTextFontCell.identifierCell, for: indexPath) as! CreateTextFontCell
                
                return cell
            case .Color:
                let cell: CreateTextColorCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTextColorCell.identifierCell, for: indexPath) as! CreateTextColorCell
                
                return cell
            default:
                let cell: CreateTextSizeCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTextSizeCell.identifierCell, for: indexPath) as! CreateTextSizeCell
                
                return cell
            }
        case .Boder:
            let sec = BorderRow(rawValue: indexPath.section)
            switch sec {
            case .Color:
                let cell: CreateTextColorCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateTextColorCell.identifierCell, for: indexPath) as! CreateTextColorCell
                
                return cell
            default:
                let cell: CreateBorderSizeCell = collectionView.dequeueReusableCell(withReuseIdentifier: CreateBorderSizeCell.identifierCell, for: indexPath) as! CreateBorderSizeCell
                
                return cell
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //
    }
}
