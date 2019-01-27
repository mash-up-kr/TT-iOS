//
//  HomeViewController.swift
//  TT
//
//  Created by 이호찬 on 24/01/2019.
//  Copyright © 2019 MashUpTT. All rights reserved.
//

import UIKit

class HomeCollectionViewController: UIViewController {

    @IBOutlet weak var projectCollectionView: UICollectionView!
    @IBOutlet weak var newProjectContainerView: UIView!
    
    private let cellIdentifier = "collection_view_cell"
    
    private var projects: [Project] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        projectCollectionView.dataSource = self
        projectCollectionView.delegate = self
        
        //dummy
        for _ in 0..<10 {
            projects.append(Project(courseTitle: "디자인과 인간 심리",
                                    courseProfessor: "이병탁 교수님",
                                    personImages: ["", "", ""],
                                    personNum: "외 1명"))
        }
        
        intializeView()
        initializeFlowLayout()
    }
    
    private func intializeView() {
        newProjectContainerView.layer.borderColor = UIColor.white.cgColor
        newProjectContainerView.layer.borderWidth = 0.5
        newProjectContainerView.layer.cornerRadius = 2
        newProjectContainerView.layer.masksToBounds = false
        newProjectContainerView.layer.shadowColor = UIColor.black.cgColor
        newProjectContainerView.layer.shadowOpacity = 0.17
        newProjectContainerView.layer.shadowRadius = 1
        newProjectContainerView.layer.shadowOffset = CGSize(width: 1, height: 2)
    }
    
    private func initializeFlowLayout() {
        let flowLayout = UICollectionViewFlowLayout()
        
        let halfWidth = (UIScreen.main.bounds.width - 50) / 2
        let halfHeight = CGFloat(190)
        
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        flowLayout.estimatedItemSize = CGSize(width: halfWidth, height: halfHeight)
        
        self.projectCollectionView.collectionViewLayout = flowLayout
    }

}

extension HomeCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: HomeCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? HomeCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.layer.cornerRadius = 2
        cell.courseTitle.text = projects[indexPath.item].courseTitle
        cell.courseProfessor.text = projects[indexPath.item].courseProfessor
        cell.personNumber.text = projects[indexPath.item].personNum
        
        RemoteRepository.shared.fetchImage(imageURL: projects[indexPath.item].personImages[0]) { (image) in cell.personFirst.image = image }
        RemoteRepository.shared.fetchImage(imageURL: projects[indexPath.item].personImages[1]) { (image) in cell.personSecond.image = image }
        RemoteRepository.shared.fetchImage(imageURL: projects[indexPath.item].personImages[2]) { (image) in cell.personThird.image = image }
        
        return cell
    }
    
}

extension HomeCollectionViewController: UICollectionViewDelegate {
    
}
