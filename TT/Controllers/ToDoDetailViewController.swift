//
//  ToDoDetailViewController.swift
//  TT
//
//  Created by 이호찬 on 24/01/2019.
//  Copyright © 2019 MashUpTT. All rights reserved.
//

import UIKit

class ToDoDetailViewController: UIViewController {
    
    let detailContentsCellIdentifier: String = "detailContentsCell"
    let detailButtonCellIdentifier: String = "detailButtonCell"
    let detailComentsHeaderCellIdentifier: String = "detailComentsHeaderCell"
    let detailComentsCellIdentifier: String = "detailComentsCell"
    
    @IBOutlet weak var detailTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailTableView.delegate = self
        detailTableView.dataSource = self
        
        detailTableView.tableFooterView = UIView()
    }
}

extension ToDoDetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 5
        case 1: return 1
        case 2: return 1
        case 3: return 2
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let cell: DetailContentsTableViewCell = self.detailTableView.dequeueReusableCell(withIdentifier: self.detailContentsCellIdentifier, for: indexPath) as? DetailContentsTableViewCell else { return UITableViewCell() }
            
            switch indexPath.row {
            case 0:
                cell.titleLabel.text = "제목"
                cell.contentsLabel.text = "레퍼런스 조사"
            case 1:
                cell.titleLabel.text = "등록날짜"
                cell.contentsLabel.text = "2019-01-02"
            case 2:
                cell.titleLabel.text = "담당자"
                cell.contentsLabel.text = "정성민, 김재희"
            case 3:
                cell.titleLabel.text = "상세설명"
                cell.contentsLabel.text = "1차 아이디어 도출된 > 레퍼런스 조사 후 회의 진행"
            case 4:
                cell.titleLabel.text = "파일"
                cell.contentsLabel.text = "https://docs.google.com/document/d/1Bo1Mu4Gf6HMzQlTXWKXtu5xqtkSq5o7WfHcVUGK3IHU/edit"
                cell.contentsLabel.textColor = UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1)
            default: break
            }
            
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 1:
            guard let cell: DetailButtonTableViewCell = self.detailTableView.dequeueReusableCell(withIdentifier: self.detailButtonCellIdentifier, for: indexPath) as? DetailButtonTableViewCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 2:
            guard let cell: DetailComentsHeaderTableViewCell = self.detailTableView.dequeueReusableCell(withIdentifier: self.detailComentsHeaderCellIdentifier, for: indexPath) as? DetailComentsHeaderTableViewCell else { return UITableViewCell() }
            
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        case 3:
            guard let cell: DetailComentsTableViewCell = self.detailTableView.dequeueReusableCell(withIdentifier: self.detailComentsCellIdentifier, for: indexPath) as? DetailComentsTableViewCell else { return UITableViewCell() }
            
            cell.userNameLabel.text = "정하예린"
            cell.dateLabel.text = "2019.01.03"
            cell.contentsLabel.text = "완료 승인하였습니다."
            
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            return cell
        default: return UITableViewCell()
        }
    }
    
    
}
