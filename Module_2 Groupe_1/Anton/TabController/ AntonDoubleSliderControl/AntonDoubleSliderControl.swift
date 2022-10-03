//
//  AntonDoubleSliderControl.swift
//  Module_2 Groupe_1
//
//  Created by air on 26.09.2022.
//

import UIKit
import SnapKit

final class AntonDoubleSliderControl: UIControl {
    
    private let defaultTrackView = CALayer()
    private let trackView = CALayer()
    private let lowerThumbView = UIImageView()
    private let upperThumbView = UIImageView()
    private let thumbsHeight: CGFloat = 15
    private let minimumValue: CGFloat = 0
    private let maximumValue: CGFloat = 1
    private var previoseLocation = CGPoint()
    
    var lowerValue: CGFloat = 0
    var upperValue: CGFloat = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
            makeUI()
        }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        makeUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayerFrames()
    }
    
    func configure(lowerValue: CGFloat = 0, upperValue: CGFloat = 1) {
        self.lowerValue = lowerValue
        self.upperValue = upperValue
    }
    
    private func makeUI() {
        backgroundColor = .clear
        
        snp.makeConstraints {
            $0.width.equalTo(21)
        }
        
        defaultTrackView.backgroundColor = UIColor(hexString: "FA0101").withAlphaComponent(0.3).cgColor
        trackView.backgroundColor = UIColor(hexString: "FA0101").cgColor
       
        layer.addSublayer(defaultTrackView)
        layer.addSublayer(trackView)
        
        [
            lowerThumbView,
            upperThumbView
        ].enumerated().forEach {
            $1.image = UIImage(named: "antonPolygon_\($0)")
            
            addSubview($1)
        }
    }
    
    private func updateLayerFrames() {
        lowerThumbView.frame = CGRect(
            x: 0,
            y: bounds.height * lowerValue,
            width: 21,
            height: thumbsHeight
        )
        
        upperThumbView.frame = CGRect(
            x: 0,
            y: bounds.height * upperValue - thumbsHeight,
            width: 21,
            height: thumbsHeight
        )
        
        defaultTrackView.frame = CGRect(x: 9, y: 0, width: 3, height: frame.height)
        defaultTrackView.setNeedsDisplay()
        
        trackView.frame = CGRect(
            origin: CGPoint(x: 9, y: lowerThumbView.frame.origin.y),
            size: CGSize(width: 3, height: upperThumbView.frame.origin.y - lowerThumbView.frame.origin.y)
        )
        trackView.setNeedsDisplay()
    }
}

extension AntonDoubleSliderControl {
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        previoseLocation = touch.location(in: self)
        
        if lowerThumbView.frame.contains(previoseLocation) {
            lowerThumbView.isHighlighted = true
        } else if upperThumbView.frame.contains(previoseLocation) {
            upperThumbView.isHighlighted = true
        }
        
        return lowerThumbView.isHighlighted || upperThumbView.isHighlighted
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let location = touch.location(in: self)
        
        let deltaLocation = location.y - previoseLocation.y
        let deltaValue = (maximumValue - minimumValue) * deltaLocation / bounds.height
        
        previoseLocation = location
        
        let thumbsHeight: CGFloat = thumbsHeight * 2 / bounds.height
        
        if lowerThumbView.isHighlighted {
            lowerValue += deltaValue
            lowerValue = boundValue(lowerValue,
                                    lower: minimumValue,
                                    upper: upperValue - thumbsHeight)
            
        } else if upperThumbView.isHighlighted {
            upperValue += deltaValue
            upperValue = boundValue(upperValue,
                                    lower: lowerValue + thumbsHeight,
                                    upper: maximumValue)
        }
        
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        updateLayerFrames()
        CATransaction.commit()
        
        func boundValue(_ value: CGFloat, lower: CGFloat, upper: CGFloat) -> CGFloat {
            min(max(value, lower), upper)
        }
        
        sendActions(for: .valueChanged)
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        lowerThumbView.isHighlighted = false
        upperThumbView.isHighlighted = false
    }
}

