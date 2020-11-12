//
//  HomeVC.swift
//  AmongUs
//
//  Created by HHumorous on 10/11/2020.
//

import UIKit

class HomeVC: BaseVC {
    
    enum Section: Int, CaseIterable {
        case Header
        case Temple
        case Custom
        
        var title: String {
            switch self {
            case .Temple:
                return "LIVE WALLPAPERS TEMPLATE"
            default:
                return "MY LIVE WALLPAPERS"
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
        clvContent.delegate = self
        clvContent.dataSource = self
        clvContent.register(UINib(nibName: HomeItemCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: HomeItemCell.identifierCell)
        clvContent.register(UINib(nibName: HomeHeaderCell.identifierCell, bundle: nil), forCellWithReuseIdentifier: HomeHeaderCell.identifierCell)
        clvContent.register(UINib(nibName: HomeTitleCell.identifierCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeTitleCell.identifierCell)
        clvContent.collectionViewLayout = createLayout()
    }
    
    func createLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            
            guard let sectionKind = Section(rawValue: sectionIndex) else { return nil }
                        
            let section: NSCollectionLayoutSection
            
            switch sectionKind {
            case .Temple:
                let width = (self.clvContent.frame.size.width - 53) / 2
                let height = (width * 232 / 156)
                
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 2)
                group.interItemSpacing = .fixed(15)
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 52, trailing: 24)
                let headerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                      heightDimension: .estimated(72))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [headerSupplementary]
            case .Header:
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 1)
                
                section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 48, leading: 0, bottom: 56, trailing: 0)
            default:
                let width = (self.clvContent.frame.size.width - 53) / 2
                let height = (width * 232 / 156)
                
                let itemGroupSize = NSCollectionLayoutSize(widthDimension: .absolute(width), heightDimension: .fractionalHeight(1.0))
                let itemGroup = NSCollectionLayoutItem(layoutSize: itemGroupSize)
                itemGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(height))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: itemGroup, count: 2)
                group.interItemSpacing = .fixed(15)
                
                section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 24, bottom: 16, trailing: 24)
                let headerSize = NSCollectionLayoutSize(widthDimension: .absolute((self.clvContent.frame.size.width)),
                                                      heightDimension: .estimated(30))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top)
                section.boundarySupplementaryItems = [headerSupplementary]
            }

            return section
        }
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
        
        return layout
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sec = Section(rawValue: section)
        if sec == .Header {
            return 1
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let section = indexPath.section
                
        let sec = Section(rawValue: section)
        
        let header: HomeTitleCell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HomeTitleCell.identifierCell, for: indexPath) as! HomeTitleCell
        
        header.lblTitle.text = sec?.title
        header.lblSubtitle.isHidden = sec == .Custom
        header.lblSubtitle.text = "SELECT TEMPLATE TO CREATE WALLPAPER"
        
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sec = Section(rawValue: indexPath.section)
        
        switch sec {
        case .Header:
            let cell: HomeHeaderCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.identifierCell, for: indexPath) as! HomeHeaderCell
            
            return cell
        default:
            let cell: HomeItemCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.identifierCell, for: indexPath) as! HomeItemCell
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sec = Section(rawValue: indexPath.section)
        
        switch sec {
        case .Temple:
            let vc: CreateVC = .load(SB: .Main)
            vc.hidesBottomBarWhenPushed = true
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
