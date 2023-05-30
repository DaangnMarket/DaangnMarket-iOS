//
//  SellListViewController.swift
//  DaangnMarket
//
//  Created by 김민 on 2023/05/24.
//

import UIKit

import SnapKit
import Then

final class SellListViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let headerView = UIView()
    private let titleLabel = UILabel().then {
        $0.text = "나의 판매내역"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
    }
    private let writeButton = UIButton().then {
        var attString = AttributedString("글쓰기")
        attString.font = .systemFont(ofSize: 13, weight: .bold)
        attString.foregroundColor = .black
        
        var config = UIButton.Configuration.plain()
        config.attributedTitle = attString
        
        $0.configuration = config
        $0.backgroundColor = .systemGray6
        $0.layer.cornerRadius = 5
    }
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .systemGray5
        $0.layer.cornerRadius = 30
    }
    
    private let segmentedControl = UnderlineSegmentedControl(items: ["판매중", "거래완료", "숨김"])
    
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return vc
    }()
    
    // MARK: - Properties
    
    lazy var sellingVC: UIViewController = SellingViewController()
    lazy var soldVC: UIViewController = SoldViewController()
    lazy var hideVC: UIViewController = HideViewController()
    lazy var dataViewControllers: [UIViewController] = [sellingVC, soldVC, hideVC]
    var currentPage: Int = 0 {
        didSet {
            let direction: UIPageViewController.NavigationDirection = oldValue <= currentPage ? .forward : .reverse
            pageViewController.setViewControllers([dataViewControllers[currentPage]], direction: direction, animated: false)
        }
    }

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBackgroundColor()
        setLayout()
        setAddTarget()
        setSegmentedControl()
        setNavigationBar()
    }
}

extension SellListViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        view.addSubviews(headerView, segmentedControl, pageViewController.view)
        headerView.addSubviews(titleLabel, writeButton, profileImageView)
        
        headerView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(100)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalToSuperview().offset(15)
        }
        
        writeButton.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.leading.equalTo(titleLabel)
        }
        
        profileImageView.snp.makeConstraints {
            $0.trailing.equalTo(-15)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(60)
        }
    }
    
    private func setAddTarget() {
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged(_:)), for: .valueChanged)
    }
    
    private func setSegmentedIndex() {
        segmentedControl.selectedSegmentIndex = 0
        segmentedValueChanged(segmentedControl)
    }
    
    private func setSegmentedControl() {
        setSegmentedIndex()
    
        segmentedControl.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        segmentedControl.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        segmentedControl.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    }
    
    private func setNavigationBar() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.backward"), style: .plain, target: self, action: #selector(backButtonDidTap))
        backButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backButton
    }

    // MARK: - @objc Methods

    @objc private func segmentedValueChanged(_ sender: UISegmentedControl) {
        self.currentPage = sender.selectedSegmentIndex
    }
    
    @objc private func backButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
}
