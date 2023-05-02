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
    var imageContainerView = UIView()
    var imageScrollView: UIScrollView!
    var profileView = UIView()
    var contentView = UIView()
    let imageContainerHeight: CGFloat = 300
    let profileContainerHeight: CGFloat = 80
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        navigationLeftBar()
        navigationRightBar()

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
    
    private func setScrollView() {
        scrollView = UIScrollView()
        scrollView.frame = view.safeAreaLayoutGuide.layoutFrame // safe area에 맞게 배치
        scrollView.isPagingEnabled = false
        scrollView.backgroundColor = .red
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
        view.addSubview(scrollView)
        
        setImageContainer()
        setProfileContainer()
        setContentContainer()
    }
    
    private func setImageContainer() {
        imageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: scrollView.frame.width, height: imageContainerHeight))
        scrollView.addSubview(imageContainerView)
        
        setImageScrollView()
    }
    
    private func setImageScrollView() {
        imageScrollView = UIScrollView()
        imageScrollView.frame = imageContainerView.frame
        imageScrollView.isPagingEnabled = true
        imageScrollView.showsHorizontalScrollIndicator = false
        imageScrollView.backgroundColor = .blue
        imageScrollView.delegate = self
        imageScrollView.contentSize = imageScrollView.frame.size
        imageContainerView.addSubview(imageScrollView)
        setProductImageView()
    }
    
    private func setProductImageView() {
        productImageView = UIView(frame: CGRect(x: 0, y: 0, width: imageScrollView.frame.width, height: imageScrollView.frame.height))
        
        let productData = fetchProductData()
        let imageCount = productData.images.count
        
        for i in 0..<imageCount {
            let imageView = UIImageView(frame: CGRect(x: productImageView.frame.width * CGFloat(i), y: 0, width: productImageView.frame.width, height: productImageView.frame.height))
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: productData.images[i])
            productImageView.addSubview(imageView)
        }
        
        imageScrollView.addSubviews(productImageView)
        imageScrollView.contentSize = CGSize(width: productImageView.frame.width * CGFloat(imageCount), height: productImageView.frame.height)
        
        setPageControl()
        
    }
    
    private func setPageControl() {
        let productData = fetchProductData()
        let imageCount = productData.images.count
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: productImageView.frame.maxY - 50, width: scrollView.frame.width, height: 50))
        pageControl.numberOfPages = imageCount
        pageControl.currentPage = 0
        imageContainerView.addSubview(pageControl)
    }
    
    private func setProfileContainer() {
        profileView = UIView(frame: CGRect(x: 0, y: productImageView.frame.maxY, width: view.frame.width, height: profileContainerHeight))
        profileView.backgroundColor = .white
        scrollView.addSubview(profileView)
        
        setProfileViewBorder()
        setProfileComponent()
    }
    
    private func setProfileViewBorder() {
        let borderLayer = CALayer()
        borderLayer.frame = profileView.bounds
        borderLayer.borderWidth = 2.0
        borderLayer.borderColor = UIColor.systemGray5.cgColor
        profileView.layer.addSublayer(borderLayer)
    }
    
    private func setProfileComponent() {
        let productData = fetchProductData()
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = productData.profileImage
        profileImageView.backgroundColor = .systemGray5
        profileImageView.layer.cornerRadius = 24
        profileImageView.layer.masksToBounds = true
        profileView.addSubview(profileImageView)
        NSLayoutConstraint.activate([
            profileImageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            profileImageView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 8),
            profileImageView.widthAnchor.constraint(equalToConstant: 50),
            profileImageView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        let nameLabel = UILabel()
        nameLabel.text = productData.nickname
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = .black
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: profileImageView.topAnchor, constant: 4)
        ])
        
        let addressLabel = UILabel()
        addressLabel.text = productData.address
        addressLabel.font = .systemFont(ofSize: 12, weight: .thin)
        addressLabel.textColor = .gray
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(addressLabel)
        NSLayoutConstraint.activate([
            addressLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            addressLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
        ])
        
        
        let tempImage = UIImageView()
        tempImage.image = UIImage(systemName: "face.smiling")
        tempImage.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(tempImage)
        NSLayoutConstraint.activate([
            tempImage.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -8),
            tempImage.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            tempImage.widthAnchor.constraint(equalToConstant: 30),
            tempImage.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        let mannerTemp = UILabel()
        mannerTemp.translatesAutoresizingMaskIntoConstraints = false
        mannerTemp.text = "\(fetchProductData().mannerTemp)°C"
        mannerTemp.textColor = .systemBlue
        mannerTemp.font = .systemFont(ofSize: 14, weight: .bold)
        profileView.addSubview(mannerTemp)
        NSLayoutConstraint.activate([
            mannerTemp.trailingAnchor.constraint(equalTo: tempImage.leadingAnchor, constant: -6),
            mannerTemp.topAnchor.constraint(equalTo: tempImage.topAnchor),
        ])
        
        let mannerProgress = UIProgressView(progressViewStyle: .default)
        mannerProgress.translatesAutoresizingMaskIntoConstraints = false
        profileView.addSubview(mannerProgress)
        mannerProgress.trackTintColor = .systemGray5
        mannerProgress.progress = fetchProductData().mannerTemp / 100
        mannerProgress.progressTintColor = .systemBlue
        profileView.addSubview(mannerProgress)
        
        NSLayoutConstraint.activate([
            mannerProgress.trailingAnchor.constraint(equalTo: mannerTemp.trailingAnchor),
            mannerProgress.bottomAnchor.constraint(equalTo: tempImage.bottomAnchor),
            mannerProgress.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setContentContainer() {
        scrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16) // 1
        ])
  
        let productData = fetchProductData()
        let titleLabel = UILabel()
        titleLabel.text = productData.title
        titleLabel.font = .systemFont(ofSize: 20, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 16)
        ])
        
        let categoryLabel = UILabel()
        categoryLabel.text = productData.category
        categoryLabel.font = .systemFont(ofSize: 12, weight: .thin)
        categoryLabel.textColor = .systemGray5
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = productData.contents
        descriptionLabel.font = .systemFont(ofSize: 14, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(lessThanOrEqualTo: scrollView.heightAnchor).isActive = true
        
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
        var productData = ProductModel(id: 1, images:["bicycle", "hare", "bicycle"],  profileImage: UIImage(systemName: "person") ?? UIImage(systemName: "person")!, nickname: "효자동 쿨거래남", address: "효자동", mannerTemp: 46.0, title: "자전거 급하게 팝니다", category: "중고", createdAt: "한 시간 전", contents: "급한 사정으로 급하게 자전거 급처분합니다. 관심있으신 분들은 얼른 연락주세요", numberOfChat: 3, numberOfInterest: 4, numberOfView: 23, price: 50000)
        return productData
    }
}

extension ProductViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }
    
}
