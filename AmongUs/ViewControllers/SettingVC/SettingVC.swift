//
//  SettingVC.swift
//  AmongUs
//
//  Created by HHumorous on 10/11/2020.
//

import UIKit

class SettingVC: BaseVC {
    
    enum Section: Int, CaseIterable {
        case Header = 0
        case Premium
        case Option
    }
    
    enum OptionRow: Int, CaseIterable {
        case RateUs = 0
        case Feedback
        case Term
        case Privacy
        
        var title: String {
            switch self {
            case .Feedback:
                return "FEEDBACK"
            case .RateUs:
                return "RATE US"
            case .Privacy:
                return "PRIVACY & POLICY"
            default:
                return "TERM OF USE"
            }
        }
        
        var icon: UIImage {
            switch self {
            case .Feedback:
                return #imageLiteral(resourceName: "iconsMail")
            case .RateUs:
                return #imageLiteral(resourceName: "iconsRate")
            case .Privacy:
                return #imageLiteral(resourceName: "iconsShield")
            default:
                return #imageLiteral(resourceName: "iconsTerm")
            }
        }
    }
    
    @IBOutlet weak var clvContent: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupCollectionView()
    }
    
    func setupCollectionView() {
        clvContent.dataSource = self
        clvContent.delegate = self
        clvContent.register(UINib(nibName: HomeHeaderCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: HomeHeaderCell.identifierCell)
        clvContent.register(UINib(nibName: SettingItemCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: SettingItemCell.identifierCell)
        clvContent.register(UINib(nibName: SettingPremiumCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: SettingPremiumCell.identifierCell)
        clvContent.collectionViewLayout = createLayout()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
                        
            let section: NSCollectionLayoutSection
            
            switch sectionKind {
            case .Premium:
                let width = (self.clvContent.frame.size.width - 48)
                
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(width))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 24, bottom: 12, trailing: 24)
            case .Header:
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 48, leading: 0, bottom: 56, trailing: 0)
            default:
                let width = (self.clvContent.frame.size.width - 48)
                let height: CGFloat = 52.0
                
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [itemGroup])
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 12
                section.contentInsets = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 44, trailing: 24)
            }

            return section
        }
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        
        return layout
    }
}

extension SettingVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sec = Section(rawValue: section)
        
        switch sec {
        case .Option:
            return OptionRow.allCases.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sec = Section(rawValue: indexPath.section)
        
        switch sec {
        case .Option:
            let cell: SettingItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingItemCell.identifierCell, for: indexPath) as! SettingItemCell
            
            let row = OptionRow(rawValue: indexPath.row)
            cell.imgIcon.image = row?.icon
            cell.lblTitle.text = row?.title
            
            return cell
        case .Premium:
            let cell: SettingPremiumCell = collectionView.dequeueReusableCell(withReuseIdentifier: SettingPremiumCell.identifierCell, for: indexPath) as! SettingPremiumCell
                        
            return cell
        default:
            let cell: HomeHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.identifierCell, for: indexPath) as! HomeHeaderCell
            
            cell.lblTitle.text = "SETTING"
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sec = Section(rawValue: indexPath.section)
        
        switch sec {
        case .Option:
            break
        case .Premium:
            let vc: PremiumVC = .load(SB: .Main)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
}
