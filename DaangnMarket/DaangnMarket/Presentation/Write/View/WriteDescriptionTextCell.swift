//
//  WriteDescriptionTextCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/23.
//

import UIKit
import SnapKit
import Then

class WriteDescriptionTextCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private lazy var descriptionTextView = UITextView().then {
        $0.delegate = self
        $0.isScrollEnabled = false
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 16)
    }
    
    private lazy var placeholderLabel = TopAlignedLabel().then {
        $0.text = "효자동에 올릴 게시글 내용을 작성해주세요.(판매 금지 물품은 게시가 제한될 수 있어요.)"
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 16)
        $0.textColor = .lightGray
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

extension WriteDescriptionTextCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubviews(descriptionTextView, placeholderLabel)
        
        descriptionTextView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-16)
            $0.height.greaterThanOrEqualTo(150)
        }
        
        placeholderLabel.snp.makeConstraints {
            $0.edges.equalTo(descriptionTextView)
              .inset(UIEdgeInsets(top: 8, left: 4, bottom: 8, right: 0))
        }
    }
}

// MARK: - UITextViewDelegate

extension WriteDescriptionTextCell: UITextViewDelegate {
    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        self.tableView?.contentOffset.y = UIScreen.main.bounds.height * 0.4
        
        UIView.setAnimationsEnabled(false)
        self.tableView?.beginUpdates()
        self.tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
        return true
    }
    
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            placeholderLabel.isHidden = true
        } else {
            placeholderLabel.isHidden = false
        }
        
//        self.tableView?.contentOffset.y = UIScreen.main.bounds.height * 0.4
        
        UIView.setAnimationsEnabled(false)
        self.tableView?.beginUpdates()
        self.tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
}
