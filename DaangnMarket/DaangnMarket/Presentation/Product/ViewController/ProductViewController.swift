//
//  ProductViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/25.
//

import UIKit

class ProductViewController: UIViewController {

    //MARK: - UI Components
    
    var homeData: Int = 0   //GET - id할 때 사용
    var homeUserId: Int = 0     //GET - userId할 때 사용
    var scrollView: UIScrollView!
    var productImageView = UIView()
    var pageControl: UIPageControl!
    var imageContainerView = UIView()
    var imageScrollView: UIScrollView!
    var profileView = UIView()
    var contentView = UIView()
    var anotherProductView = UIView()
    let imageContainerHeight: CGFloat = 300
    let profileContainerHeight: CGFloat = 80
    let pageControlHeight: CGFloat = 50
    var contentViewHeight: Int = 0
    var otherProductHeight: CGFloat = 250
    var priceTabHeight: CGFloat = 80
    var collectionView: UICollectionView!
    
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
        scrollView.backgroundColor = .white
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height)
        view.addSubview(scrollView)
        
        setImageContainer()
        setProfileContainer()
        setContentContainer()
        setOtherProductContainer()
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
        
        pageControl = UIPageControl(frame: CGRect(x: 0, y: productImageView.frame.maxY - pageControlHeight, width: scrollView.frame.width, height: 50))
        pageControl.numberOfPages = imageCount
        pageControl.currentPage = 0
        imageContainerView.addSubview(pageControl)
    }
    
    private func setProfileContainer() {
        profileView = UIView(frame: CGRect(x: 0, y: productImageView.frame.maxY, width: view.frame.width, height: profileContainerHeight))
        profileView.backgroundColor = .white
        scrollView.addSubview(profileView)
        
        setProfileComponent()
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
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.gray.cgColor
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]

        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
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
        categoryLabel.font = .systemFont(ofSize: 12, weight: .regular)
        categoryLabel.textColor = .systemGray
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: categoryLabel.text ?? "", attributes: underlineAttribute)
        categoryLabel.attributedText = underlineAttributedString
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            categoryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14)
        ])
        
        let createdLabel = UILabel()
        createdLabel.text = "·  \(productData.createdAt)"
        createdLabel.font = .systemFont(ofSize: 12, weight: .regular)
        createdLabel.textColor = .systemGray
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(createdLabel)
        NSLayoutConstraint.activate([
            createdLabel.leadingAnchor.constraint(equalTo: categoryLabel.trailingAnchor, constant: 8),
            createdLabel.centerYAnchor.constraint(equalTo: categoryLabel.centerYAnchor)
        ])
        
        let descriptionLabel = UILabel()
        descriptionLabel.text = productData.contents
        descriptionLabel.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(descriptionLabel)
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            descriptionLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
        
        let chattingLabel = UILabel()
        chattingLabel.text = "채팅 \(productData.numberOfChat)"
        chattingLabel.font = .systemFont(ofSize: 12, weight: .regular)
        chattingLabel.textColor = .systemGray
        chattingLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(chattingLabel)
        NSLayoutConstraint.activate([
            chattingLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            chattingLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20)
        ])
        
        let interestLabel = UILabel()
        interestLabel.text = "·  관심 \(productData.numberOfInterest)"
        interestLabel.font = .systemFont(ofSize: 12, weight: .regular)
        interestLabel.textColor = .systemGray
        interestLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(interestLabel)
        NSLayoutConstraint.activate([
            interestLabel.leadingAnchor.constraint(equalTo: chattingLabel.trailingAnchor, constant: 8),
            interestLabel.centerYAnchor.constraint(equalTo: chattingLabel.centerYAnchor)
        ])
        
        let viewLabel = UILabel()
        viewLabel.text = "·  조회 \(productData.numberOfView)"
        viewLabel.font = .systemFont(ofSize: 12, weight: .regular)
        viewLabel.textColor = .systemGray
        viewLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(viewLabel)
        NSLayoutConstraint.activate([
            //            viewLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor),
            viewLabel.leadingAnchor.constraint(equalTo: interestLabel.trailingAnchor, constant: 8),
            viewLabel.centerYAnchor.constraint(equalTo: chattingLabel.centerYAnchor),
            viewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
        
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.heightAnchor.constraint(equalToConstant:
                                                contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height).isActive = true
        
        contentViewHeight = Int(contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height)
    }
    
    private func setOtherProductContainer() {
        
        setOtherProductHeight()
        
        anotherProductView = UIView(frame: CGRect(x: 0, y: imageContainerHeight + CGFloat(contentViewHeight) + profileContainerHeight + pageControlHeight, width: scrollView.frame.width, height: otherProductHeight))
        anotherProductView.backgroundColor = .green
        
        scrollView.addSubview(anotherProductView)
        setOtherProductCollectionView()

        NSLayoutConstraint.activate([
            anotherProductView.topAnchor.constraint(equalTo: contentView.bottomAnchor),
            anotherProductView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -priceTabHeight),
        ])
        
        anotherProductView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        anotherProductView.heightAnchor.constraint(lessThanOrEqualTo: scrollView.heightAnchor).isActive = true
        
    }
    
    private func setOtherProductHeight() {
        let fetchOtherProductNumber = fetchUserProductData().count
        
        if fetchOtherProductNumber == 0 {
            otherProductHeight = 0
        } else if fetchOtherProductNumber == 1 || fetchOtherProductNumber == 2 {
            otherProductHeight = 170
        } else {
            otherProductHeight = 250
        }
    }

    private func setOtherProductCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.headerReferenceSize = CGSize(width: collectionView.bounds.width, height: 50)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        anotherProductView.addSubview(collectionView)

        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: anotherProductView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: anotherProductView.leadingAnchor, constant: 10),
            collectionView.bottomAnchor.constraint(equalTo: anotherProductView.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: anotherProductView.trailingAnchor, constant: -10)
        ])
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(OtherProductCollectionViewCell.self, forCellWithReuseIdentifier: "OtherProductCollectionViewCell")
        collectionView.register(OtherProductCollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: OtherProductCollectionHeaderView.reuseIdentifier)

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
    
    @objc fileprivate func buttonTapped() {
        print("tapped()")
    }
    
}

//MARK: - Product Collection View Dummy Data

extension ProductViewController {
    
    func fetchProductData() -> ProductModel {
        var productData = ProductModel(images:["bicycle", "hare", "bicycle"],  profileImage: UIImage(systemName: "person") ?? UIImage(systemName: "person")!, nickname: "효자동 쿨거래남", address: "효자동", mannerTemp: 46.0, title: "자전거 급하게 팝니다", category: "중고", createdAt: "한 시간 전", contents: "급한 사정으로 급하게 자전거 급처분합니다. 관심있으신 분들은 얼른 연락주세요", numberOfChat: 3, numberOfInterest: 4, numberOfView: 23, price: 50000)
        return productData
    }
}

//MARK: - Other Product Collection View Dummy Data

extension ProductViewController {
    
    func fetchUserProductData() -> [OtherProductModel] {
        var dummy1 = OtherProductModel(id: 3, image: "flag.checkered.2.crossed", title: "포스코 동복 작업바지 34", price: 14000)
        let dummy2 = OtherProductModel(id: 7, image: "externaldrive.badge.person.crop", title: "뭔 림난미ㅏ웆비ㅏ우lasdnlknqwldknsa지 34", price: 510000)
        let dummy3 = OtherProductModel(id: 8, image: "flag.checkered.2.crossed", title: "우4ㅣㅁ누이아ㅜㅂ지ㅏㅇ", price: 24000)
        let dummy4 = OtherProductModel(id: 12, image: "flag.checkered.2.crossed", title: "포스코 동복 작업바지 34", price: 990000)

        return [dummy1, dummy2, dummy3, dummy4]
    }
}

//MARK: - Product View Scroll Delegate

extension ProductViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.frame.width
        let currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        pageControl.currentPage = currentPage
    }

}

//MARK: - Other Product Collection View Delegate

extension ProductViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let fetchDataNumber = fetchUserProductData().count
        
        return fetchDataNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let fetchData = fetchUserProductData()
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OtherProductCollectionViewCell", for: indexPath) as! OtherProductCollectionViewCell
        
        cell.imageView.image = UIImage(systemName: fetchData[indexPath.row].image)
        cell.title.text = fetchData[indexPath.row].title
        cell.price.text = "\(fetchData[indexPath.row].price)원"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let fetchData = fetchUserProductData()
        print("id \(fetchData[indexPath.row].id) Tapped")
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let fetchData = fetchProductData()
        
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: OtherProductCollectionHeaderView.reuseIdentifier, for: indexPath) as? OtherProductCollectionHeaderView else {
                fatalError("Cannot dequeue reusable header view")
            }
            headerView.titleLabel.text = "\(fetchData.nickname)님의 판매 상품"
            headerView.titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
            headerView.headerImageView.image = UIImage(systemName: "chevron.right") // 이미지 설정

            return headerView
        default:
            fatalError("Unsupported supplementary view type")
        }
    }
    
}


extension ProductViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: anotherProductView.frame.width / 2 - 20, height: 120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
}
