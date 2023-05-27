//
//  UnderlineSegmentedControl.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/26.
//

import UIKit

import SnapKit
import Then

final class UnderlineSegmentedControl: UISegmentedControl {
    
    // MARK: - UI Components
    
    private lazy var underlineView: UIView = {
        let width = self.bounds.size.width / CGFloat(self.numberOfSegments)
        let height = 4.0
        let xPosition = CGFloat(self.selectedSegmentIndex * Int(width))
        let yPosition = self.bounds.size.height - 1.0
        let frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        
        let view = UIView(frame: frame)
        view.backgroundColor = .black
        addSubview(view)
        return view
    }()

    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        removeDefaultStyle()
    }
    
    override init(items: [Any]?) {
        super.init(items: items)
        
        removeDefaultStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let underlineFinalXPosition = (self.bounds.width / CGFloat(self.numberOfSegments)) * CGFloat(self.selectedSegmentIndex)
        UIView.animate(
          withDuration: 0.3,
          animations: {
            self.underlineView.frame.origin.x = underlineFinalXPosition
          }
        )
    }
}

extension UnderlineSegmentedControl {
    
    // MARK: - Custom Methods
    
    private func removeDefaultStyle() {
        setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
}
