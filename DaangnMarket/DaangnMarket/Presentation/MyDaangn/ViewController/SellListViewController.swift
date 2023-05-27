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
    
    private let headerView = UIView().then {
        $0.backgroundColor = .gray
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