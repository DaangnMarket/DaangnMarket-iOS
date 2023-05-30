//
//  SelectedImageView.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/30.
//

import UIKit

protocol SelectedImageViewDelegate: AnyObject {
    func deleteImage(_ view: UIView)
}

class SelectedImageView: UIView {
    
    // MARK: - Properties
    
    weak var delegate: SelectedImageViewDelegate?
    private var image: UIImage?
    
    // MARK: - UI Components
    
    private lazy var selectedImageView = UIImageView().then {
        $0.image = image
        $0.sizeToFit()
    }
    
    private let deleteButton = UIButton().then {
        $0.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        $0.tintColor = .black
        $0.alpha = 0.8
        $0.addTarget(self, action: #selector(xButtonDidTap(_:)), for: .touchUpInside)
    }
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(image: UIImage, button: Bool) {
        self.init()
        self.image = image
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SelectedImageView {
    
    // MARK: - Custom Methods
    
    func setUI() {
        backgroundColor = .clear
    }
    
    func setLayout() {
        addSubviews(selectedImageView, deleteButton)
        
        selectedImageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 0, bottom: 0, right: 8))
            $0.width.equalTo(selectedImageView.snp.height)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview()
            $0.size.equalToSuperview().multipliedBy(0.3)
        }
    }
    
    // MARK: - @objc Methods
    
    @objc private func xButtonDidTap(_ button: UIButton) {
        delegate?.deleteImage(self)
    }
}
