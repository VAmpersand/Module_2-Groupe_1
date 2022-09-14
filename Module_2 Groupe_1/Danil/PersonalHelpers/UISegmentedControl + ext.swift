//
//  UISegmentedControl + ext.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 13.09.2022.
//

import UIKit

extension UISegmentedControl {
    
    func removeBorder(){
        tintColor = .clear
        backgroundColor = .white
        setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.orange], for: .selected)
        setTitleTextAttributes( [NSAttributedString.Key.foregroundColor : UIColor.gray], for: .normal)
        if #available(iOS 13.0, *) {
            selectedSegmentTintColor = UIColor.clear
        }
        
    }
    
    func setupSegment() {
        removeBorder()
        let segmentUnderlineWidth: CGFloat = bounds.width
        let segmentUnderlineHeight: CGFloat = 2.0
        let segmentUnderlineXPosition = bounds.minX
        let segmentUnderLineYPosition = bounds.size.height - 1.0
        let segmentUnderlineFrame = CGRect(x: segmentUnderlineXPosition, y: segmentUnderLineYPosition, width: segmentUnderlineWidth, height: segmentUnderlineHeight)
        let segmentUnderline = UIView(frame: segmentUnderlineFrame)
        segmentUnderline.backgroundColor = UIColor.clear
        addSubview(segmentUnderline)
        addUnderlineForSelectedSegment()
    }
    
    func addUnderlineForSelectedSegment(){
        let underlineWidth: CGFloat = self.bounds.size.width / CGFloat(numberOfSegments)
        let underlineHeight: CGFloat = 2.0
        let underlineXPosition = CGFloat(selectedSegmentIndex * Int(underlineWidth))
        let underLineYPosition = bounds.size.height - 1.0
        let underlineFrame = CGRect(x: underlineXPosition, y: underLineYPosition, width: underlineWidth, height: underlineHeight)
        let underline = UIView(frame: underlineFrame)
        underline.backgroundColor = UIColor.orange
        underline.tag = 1
        addSubview(underline)
    }
    
    func changeUnderlinePosition(){
        guard let underline = self.viewWithTag(1) else {return}
        let underlineFinalXPosition = (bounds.width / CGFloat(numberOfSegments)) * CGFloat(selectedSegmentIndex)
        underline.frame.origin.x = underlineFinalXPosition
    }
}
