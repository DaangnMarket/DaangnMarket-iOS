//
//  WritePriceTextCell.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/23.
//

import UIKit
import SnapKit
import Then

final class WritePriceTextCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let priceLabel = UILabel().then {
        $0.text = "₩"
        $0.numberOfLines = 0
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 16)
    }
    
    private lazy var priceTextField = UITextField().then {
        $0.delegate = self
        $0.autocorrectionType = .no
        $0.keyboardType = .numberPad
        $0.borderStyle = .none
        $0.placeholder = "가격 (선택사항)"
        $0.font = .systemFont(ofSize: 16)
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

extension WritePriceTextCell {
    
    // MARK: - Custom Methods
    
    private func setUI() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func setLayout() {
        contentView.addSubviews(priceLabel, priceTextField)
        
        priceLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.centerY.equalToSuperview()
        }
        
        priceTextField.snp.makeConstraints {
            $0.leading.equalTo(priceLabel.snp.trailing).offset(10)
            $0.centerY.equalToSuperview()
        }
    }
}


// MARK: - UITextFieldDelegate

extension WritePriceTextCell: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let txt = textField.text else { return }
        priceLabel.textColor = txt.isEmpty ? .gray : .black
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.lowerBound < 8 {
            return true
        } else {
            textField.text = "99999999"
            return false
        }
    }
}
