//
//  ProductViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/25.
//

import UIKit

class ProductViewController: UIViewController {

    //MARK: - UI Components
    
    var homeData: Int = 0
    var scrollView: UIScrollView!
    var productImageView = UIView()
    var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        navigationLeftBar()
        navigationRightBar()
        setNavigationStyle()

        setScrollView()
    }
    

}

extension ProductViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .black
    }
    
    private func navigationLeftBar() {
        let backButtonImage = UIImage(systemName: "chevron.left")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let backButton = UIButton()
        backButton.setImage(backButtonImage, for: .normal)
        backButton.semanticContentAttribute = .forceRightToLeft
        backButton.addTarget(self, action: #selector(backButtonDidTap), for: .touchUpInside)
        let back = UIBarButtonItem(customView: backButton)
        
        let homeButtonImage = UIImage(named: "TabHome")
        let homeButton = UIButton()
        homeButton.setImage(homeButtonImage, for: .normal)
        homeButton.semanticContentAttribute = .forceRightToLeft
        homeButton.addTarget(self, action: #selector(homeButtonDidTap), for: .touchUpInside)
        let home = UIBarButtonItem(customView: homeButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
        
        navigationItem.leftBarButtonItems = [back, spacer, home]
        
    }
    
    private func navigationRightBar() {
        let shareButtonImage = UIImage(systemName: "square.and.arrow.up")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let shareButton = UIButton()
        shareButton.setImage(shareButtonImage, for: .normal)
        shareButton.addTarget(self, action: #selector(shareButtonDidTap), for: .touchUpInside)
        let share = UIBarButtonItem(customView: shareButton)
        
        let declareButtonImage = UIImage(systemName: "ellipsis")?.withTintColor(.white, renderingMode: .alwaysOriginal)
        let declareButton = UIButton()
        declareButton.setImage(declareButtonImage, for: .normal)
        declareButton.addTarget(self, action: #selector(declareButtonDidTap), for: .touchUpInside)
        let declare = UIBarButtonItem(customView: declareButton)
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spacer.width = 16
        
        navigationItem.rightBarButtonItems = [declare, spacer, share]
        
    }
    
    private func setNavigationStyle() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setScrollView() {
        scrollView = UIScrollView()
        scrollView.frame = view.safeAreaLayoutGuide.layoutFrame // safe area에 맞게 배치
        scrollView.isPagingEnabled = true
        scrollView.backgroundColor = .red
        scrollView.contentInsetAdjustmentBehavior = .never
//        scrollView.delegate = self
        scrollView.contentSize = scrollView.frame.size
        view.addSubview(scrollView)
        setProductImageView()
        
    }
    
    private func setProductImageView() {
        productImageView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width, height: 200))
        productImageView.backgroundColor = .gray
        
        let productData = fetchProductData()
        let imageCount = productData.images.count
        
        for i in 0..<imageCount {
            let imageView = UIImageView(frame: CGRect(x: productImageView.frame.width * CGFloat(i), y: 0, width: productImageView.frame.width, height: productImageView.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: productData.images[i])
            productImageView.addSubview(imageView)
        }
        
        scrollView.addSubviews(productImageView)
        scrollView.contentSize = CGSize(width: productImageView.frame.width * CGFloat(imageCount), height: productImageView.frame.height)
        
        setPageControl()
        
    }
    
    private func setPageControl() {
        let productData = fetchProductData()
        let imageCount = productData.images.count
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: productImageView.frame.maxY + 10, width: scrollView.frame.width, height: 50))
        pageControl.numberOfPages = imageCount
        pageControl.currentPage = 0
        scrollView.addSubview(pageControl)
    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func backButtonDidTap() {
        self.navigationController?.popViewController(animated: true)
    }

    @objc fileprivate func homeButtonDidTap() {
        let homeVC = HomeViewController()
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @objc fileprivate func shareButtonDidTap() {
        print("shareButtonDidTap() called")
    }
    
    @objc fileprivate func declareButtonDidTap() {
        print("shareButtonDidTap() called")
    }
    
}

//MARK: - Product Collection View Dummy Data

extension ProductViewController {
    
    func fetchProductData() -> ProductModel {
        var productData = ProductModel(id: 1, images:["bicycle", "hare", "bicycle"],  profileImage: UIImage(systemName: "person") ?? UIImage(systemName: "person")!, nickname: "효자동 쿨거래남", address: "효자동", mannerTemp: 46, title: "자전거 급하게 팝니다", category: "중고", createdAt: "한 시간 전", contents: "급한 사정으로 급하게 자전거 급처분합니다. 관심있으신 분들은 얼른 연락주세요", numberOfChat: 3, numberOfInterest: 4, numberOfView: 23, price: 50000)
        return productData
    }
}

