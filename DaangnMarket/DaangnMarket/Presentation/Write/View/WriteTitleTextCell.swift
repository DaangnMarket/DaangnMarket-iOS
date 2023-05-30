//
//  writeTitleTextCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/23.
//

import UIKit
import SnapKit
import Then

final class WriteTitleTextCell: UITableViewCell {
    enum Font {
        static let regular: UIFont = .systemFont(ofSize: 16)
    }
    
    // MARK: - UI Components
    
    private lazy var titleTextView = UITextView().then {
        $0.delegate = self
        $0.isScrollEnabled = false
        $0.sizeToFit()
        $0.font = Font.regular
    }
    
    private let placeholderLabel = UILabel().then {
        $0.text = "글 제목"
        $0.textColor = .lightGray
        $0.font = Font.regular
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

extension WriteTitleTextCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .white
    }
    
    private func setLayout() {
        contentView.addSubviews(titleTextView, placeholderLabel)
        
        titleTextView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview().offset(-12)
        }
        
        placeholderLabel.snp.makeConstraints {
            $0.leading.equalTo(titleTextView).offset(4)
            $0.centerY.equalTo(titleTextView)
        }
    }
}


// MARK: - UITextFieldDelegate

extension WriteTitleTextCell: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        if !textView.text.isEmpty {
            placeholderLabel.isHidden = true
        } else {
            placeholderLabel.isHidden = false
        }
        
        // 이하로 typing line overflow시 height 확장시킬 수 있음
        UIView.setAnimationsEnabled(false)
        self.tableView?.beginUpdates()
        self.tableView?.endUpdates()
        UIView.setAnimationsEnabled(true)
    }
    
    // return key 입력 시 무시
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        return text != "\n"
    }
}
