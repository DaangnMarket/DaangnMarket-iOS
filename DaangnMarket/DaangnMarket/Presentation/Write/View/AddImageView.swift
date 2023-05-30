//
//  AddImageView.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/28.
//

import UIKit

protocol AddImageViewDelegate: AnyObject {
    func openPicker()
}

class AddImageView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: AddImageViewDelegate?
    
    var imageCount = 0 {
        didSet {
            countLabel.text = "\(self.imageCount)/10"
            if self.imageCount != 0 {
                countLabel.attributedText = NSMutableAttributedString()
                    .regular(string: "\(self.imageCount)", textColor: UIColor.daangnOrange, fontSize: 12)
                    .regular(string: "/10", fontSize: 12)
            }
        }
    }
    
    // MARK: - UI Components
    
    private let addImageView = UIView().then {
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    
    private let cameraImageView = UIImageView().then {
        $0.image = UIImage(systemName: "camera.fill")
        $0.tintColor = .black
        $0.sizeToFit()
    }
    
    private lazy var countLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12)
        $0.text = "\(imageCount)/10"
        $0.textColor = .gray
        $0.textAlignment = .center
    }
    
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(count: Int) {
        self.init()
        imageCount = count
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension AddImageView {
    
    // MARK: - Custom Methods
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setLayout() {
        addSubviews(addImageView)
        addImageView.addSubviews(cameraImageView, countLabel)
        
        addImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 8))
            $0.width.equalTo(addImageView.snp.height)
        }
        
        cameraImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(12)
            $0.centerX.equalToSuperview()
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(cameraImageView.snp.bottom).offset(8)
            $0.bottom.equalToSuperview().offset(-12)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if imageCount < 10 {
            delegate?.openPicker()
        }
        // TODO: - 10개 초과 업로드 막기
//        else {
//            fullImagesAlert()
//        }
    }
}
