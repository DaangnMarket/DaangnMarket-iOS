//
//  WritePhotosCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/28.
//

import UIKit
import SnapKit
import Then

final class WritePhotosCell: UITableViewCell {
    
    // MARK: - Properties
    
    private var imageCount = 0 {
        didSet {
            addImageView.imageCount = self.imageCount
        }
    }
    
    // MARK: - UI Components
    
    lazy var addImageView = AddImageView(count: imageCount)
    
    private let photosScrollView = UIScrollView().then {
        $0.showsHorizontalScrollIndicator = false
    }
    
    private let selectedStackView = UIStackView().then {
        $0.alignment = .bottom
        $0.axis = .horizontal
        $0.distribution = .equalSpacing
        $0.spacing = 8
    }
    
    // MARK: - Initializer
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WritePhotosCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubviews(photosScrollView)
        photosScrollView.addSubview(selectedStackView)
        selectedStackView.addArrangedSubview(addImageView)
        
        photosScrollView.snp.makeConstraints {
            $0.edges.equalTo(contentView)
            $0.size.equalTo(contentView)
        }
        
        
        selectedStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 8))
            $0.height.equalToSuperview().multipliedBy(0.8)
        }
        
        addImageView.snp.makeConstraints {
            $0.width.equalTo(addImageView.snp.height)
            $0.height.equalToSuperview()
        }
    }
}


// MARK: - WriteUsedViewControllerDelegate

extension WritePhotosCell: WriteUsedViewControllerDelegate {
    func selectImage(image: UIImage) {
        let selectImageView = SelectedImageView(image: image, button: true)
        selectImageView.delegate = self
        selectedStackView.addArrangedSubview(selectImageView)
        imageCount += 1
        selectImageView.snp.makeConstraints {
            $0.size.equalTo(addImageView)
        }
        guard let parentVC = self.tableView?.parentViewController as? WriteUsedViewController else { return }
        parentVC.uploadImages.append(image)
    }
}


// MARK: - SelectedImageViewDelegate

extension WritePhotosCell: SelectedImageViewDelegate {
    func deleteImage(_ view: UIView) {
        print("delete")
        if let idx = selectedStackView.arrangedSubviews.firstIndex(of: view) {
            guard let parentVC = self.tableView?.parentViewController as? WriteUsedViewController else { return }
            parentVC.uploadImages.remove(at: idx - 1)
        }
        UIView.animate(withDuration: 0.3) {
            self.imageCount -= 1
            self.selectedStackView.arrangedSubviews
                .filter { $0.isEqual(view) }
                .first?
                .do { $0.removeFromSuperview() }
            self.tableView?.superview?.layoutIfNeeded()
        }
    }
}
