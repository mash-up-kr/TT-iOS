//
//  DetailButtonTableViewCell.swift
//  TT
//
//  Created by 김재희 on 28/01/2019.
//  Copyright © 2019 MashUpTT. All rights reserved.
//

import UIKit

class DetailButtonTableViewCell: UITableViewCell {

    @IBOutlet var approvalNumberLabel: UILabel!
    @IBOutlet var approvalButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.approvalButton.layer.addBorder([.top, .left, .right, .bottom], color: UIColor(red: 74/255, green: 96/255, blue: 231/255, alpha: 1), width: 2.0)
    }
}

extension CALayer {
    func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
        for edge in arr_edge {
            let border = CALayer()
            switch edge {
            case UIRectEdge.top:
                border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                break
            case UIRectEdge.bottom:
                border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                break
            case UIRectEdge.left:
                border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                break
            case UIRectEdge.right:
                border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                break
            default:
                break
            }
            border.backgroundColor = color.cgColor;
            self.addSublayer(border)
        }
    }
}
