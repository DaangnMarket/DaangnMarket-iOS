//
//  MyAddressViewController.swift
//  DaangnMarket
//
//  Created by KimTaeHyung on 2023/04/27.
//

import CoreLocation
import UIKit


class MyAddressViewController: UIViewController, MTMapViewDelegate {
    
    //MARK: - UI Components
    
    private var mapView = UIView()
    private var myAddressView = UIView()
    private var addressTitle = UILabel()
    private var firstView = UIView()
    private var secondView = UIView()
    private var homeCityData = HomeCityName(cityName: ["효자동"])
    var kakaoMap: MTMapView?
    var locationManager: CLLocationManager!
    var mapPoint1: MTMapPoint?
    var poiItem1: MTMapPOIItem?
    let firstLabel = UILabel()
    let secondLabel = UILabel()

    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackgroundColor()
        setNavigationLeftBar()
        setNavigationTitle()
        setNavigationRightBar()
        
        setMapView()
        setMyAddressView()
    }
}
extension MyAddressViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationLeftBar() {
        // 왼쪽 상단에 닫기 버튼을 추가합니다.
        let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .plain, target: self, action: #selector(closeModalDidTap))
        closeButton.tintColor = .black
        navigationItem.leftBarButtonItem = closeButton
    }
    
    private func setNavigationTitle() {
        title = "내 동네 설정"
    }
    
    private func setNavigationRightBar() {
        let questionButton = UIBarButtonItem(image: UIImage(systemName: "questionmark.circle"), style: .plain, target: self, action: #selector(questionButtonDidTap))
        questionButton.tintColor = .black
        navigationItem.rightBarButtonItem = questionButton
    }
    
    private func setMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.backgroundColor = .red
        
        view.addSubview(mapView)
        
        setKakaoMap()
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: view.bounds.height * 0.6)
        ])
        
    }
    
    private func setKakaoMap() {
        kakaoMap = MTMapView(frame: mapView.bounds)
        if let kakaoMap = kakaoMap {
            kakaoMap.delegate = self
            kakaoMap.baseMapType = .standard
            
////             현재 위치 트래킹
//                        kakaoMap.showCurrentLocationMarker = true
//                        kakaoMap.currentLocationTrackingMode = .onWithoutHeading
//
////             마커 추가
//                        self.mapPoint1 = MTMapPoint(geoCoord: MTMapPointGeo(latitude:  37.585568, longitude: 127.019148))
//                        poiItem1 = MTMapPOIItem()
//                        poiItem1?.markerType = MTMapPOIItemMarkerType.bluePin
//                        poiItem1?.mapPoint = mapPoint1
//                        poiItem1?.itemName = "아무데나 찍어봄"
//                        kakaoMap.add(poiItem1)
            
            mapView.addSubview(kakaoMap)
        }
    }
    
    // Custom: 현 위치 트래킹 함수
    func kakaoMap(_ mapView: MTMapView!, updateCurrentLocation location: MTMapPoint!, withAccuracy accuracy: MTMapLocationAccuracy) {
        let currentLocation = location?.mapPointGeo()
        if let latitude = currentLocation?.latitude, let longitude = currentLocation?.longitude{
            print("MTMapView updateCurrentLocation (\(latitude),\(longitude)) accuracy (\(accuracy))")
        }
    }
    
    func kakaoMap(_ mapView: MTMapView?, updateDeviceHeading headingAngle: MTMapRotationAngle) {
        print("MTMapView updateDeviceHeading (\(headingAngle)) degrees")
    }
    
    private func setMyAddressView() {
        myAddressView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(myAddressView)
        
        NSLayoutConstraint.activate([
            myAddressView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myAddressView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            myAddressView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        mapView.bottomAnchor.constraint(equalTo: myAddressView.topAnchor).isActive = true
        
        setAddressView()
    }
    
    private func setAddressView() {
        addressTitle.text = "내 동네"
        addressTitle.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        addressTitle.translatesAutoresizingMaskIntoConstraints = false
        addressTitle.tintColor = .black
        
        
        
        setupButton()
        
        
        myAddressView.addSubview(addressTitle)
        myAddressView.addSubview(firstView)
        myAddressView.addSubview(secondView)
        
        NSLayoutConstraint.activate([
            addressTitle.topAnchor.constraint(equalTo: myAddressView.topAnchor, constant: 20),
            addressTitle.leadingAnchor.constraint(equalTo: myAddressView.leadingAnchor, constant: 12),
            firstView.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 12),
            firstView.leadingAnchor.constraint(equalTo: myAddressView.leadingAnchor, constant: 12),
            firstView.heightAnchor.constraint(equalToConstant: 50),
            secondView.topAnchor.constraint(equalTo: addressTitle.bottomAnchor, constant: 12),
            secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 8),
            secondView.trailingAnchor.constraint(equalTo: myAddressView.trailingAnchor, constant: -12),
            secondView.widthAnchor.constraint(equalTo: firstView.widthAnchor),
            secondView.heightAnchor.constraint(equalTo: firstView.heightAnchor)
        ])
        
    }
    
    private func setupButton() {
        
        //        firstButton.configuration = .filled()
        //        firstButton.configuration?.baseBackgroundColor = .orange
        //        firstButton.configuration?.title = homeCityData.cityName[0]
        //        firstButton.configuration?.titleAlignment = .leading // title을 leading으로 정렬
        firstView.translatesAutoresizingMaskIntoConstraints = false
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        if homeCityData.cityName.count == 1 {
            oneCitySelected()
        } else if homeCityData.cityName.count == 2 {
            //            secondButton.configuration = .filled()
            //            secondButton.configuration?.baseBackgroundColor = .orange
            //            secondButton.configuration?.title = homeCityData.cityName[1]
            //            secondButton.configuration?.titleAlignment = .leading // title을 leading으로 정렬
            twoCitySelected()
        }
    }
    
    private func oneCitySelected() {
        let xmarkImage = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        let closeButton = UIImageView(image: xmarkImage)
        let xmarkTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonDidTapWhenOne))
        let firstLabel = UILabel()
        
        let plusImage = UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate)
        let plusButton = UIButton()
        plusButton.translatesAutoresizingMaskIntoConstraints = false
        plusButton.setImage(plusImage, for: .normal)
        plusButton.tintColor = .black
        plusButton.addTarget(self, action: #selector(plusButtonDidTap), for: .touchUpInside)

        closeButton.tintColor = .white
        closeButton.addGestureRecognizer(xmarkTapGesture)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isUserInteractionEnabled = true
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = homeCityData.cityName[0]
        firstLabel.textColor = .white
        
        
        firstView.backgroundColor = .orange
        firstView.layer.cornerRadius = 6
        firstView.addSubviews(firstLabel, closeButton)
        
        secondView.backgroundColor = .systemGray6
        secondView.layer.cornerRadius = 6

        secondView.addSubview(plusButton)
        
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 8),
            firstLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            firstLabel.topAnchor.constraint(equalTo: firstView.topAnchor),
            firstLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -8),
            closeButton.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            
            plusButton.centerXAnchor.constraint(equalTo: secondView.centerXAnchor),
            plusButton.centerYAnchor.constraint(equalTo: secondView.centerYAnchor)
            
        ])
    }
    
    private func twoCitySelected() {
        let xmarkImage = UIImage(systemName: "xmark")?.withRenderingMode(.alwaysTemplate)
        let closeButton = UIImageView(image: xmarkImage)
        let secondCloseButton = UIImageView(image: xmarkImage)
        let xmarkTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonDidTapWhenTwoOfOne))
        let secondXmarkTapGesture = UITapGestureRecognizer(target: self, action: #selector(closeButtonDidTapWhenTwoOfTwo))

        closeButton.tintColor = .white
        closeButton.addGestureRecognizer(xmarkTapGesture)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.isUserInteractionEnabled = true
        
        secondCloseButton.tintColor = .black
        secondCloseButton.addGestureRecognizer(secondXmarkTapGesture)
        secondCloseButton.translatesAutoresizingMaskIntoConstraints = false
        secondCloseButton.isUserInteractionEnabled = true
        
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.text = homeCityData.cityName[0]
        firstLabel.textColor = .white
        
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        secondLabel.text = homeCityData.cityName[1]
        secondLabel.textColor = .black
        
        
        firstView.backgroundColor = .orange
        firstView.layer.cornerRadius = 6
        firstView.addSubviews(firstLabel, closeButton)
        
        secondView.backgroundColor = .systemGray6
        secondView.layer.cornerRadius = 6

        secondView.addSubviews(secondLabel, secondCloseButton)
        
        NSLayoutConstraint.activate([
            firstLabel.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 8),
            firstLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            firstLabel.topAnchor.constraint(equalTo: firstView.topAnchor),
            firstLabel.bottomAnchor.constraint(equalTo: firstView.bottomAnchor),
            
            secondLabel.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 8),
            secondLabel.trailingAnchor.constraint(equalTo: secondView.trailingAnchor),
            secondLabel.topAnchor.constraint(equalTo: secondView.topAnchor),
            secondLabel.bottomAnchor.constraint(equalTo: secondView.bottomAnchor),
            
            closeButton.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -8),
            closeButton.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
            closeButton.widthAnchor.constraint(equalToConstant: 20),
            closeButton.heightAnchor.constraint(equalToConstant: 20),
            
            secondCloseButton.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -8),
            secondCloseButton.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
            secondCloseButton.widthAnchor.constraint(equalToConstant: 20),
            secondCloseButton.heightAnchor.constraint(equalToConstant: 20)
            

            
        ])
    }
    
    //MARK: - @objc Methods
    
    @objc fileprivate func closeModalDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func questionButtonDidTap() {
        print("questionButtonDidTap()")
    }
    
    @objc fileprivate func closeButtonDidTapWhenOne() {
        print("closeButtonDidTapWhenOne()")
        let alertController = UIAlertController(title: "", message: "동네는 최소 1개 이상 선택해야\n해요. 현재 설정된 동네를\n 변경하시겠어요?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            let searchAddressVC = SearchAddressViewController()
            
            self.navigationController?.pushViewController(searchAddressVC, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let messageText = "동네는 최소 1개 이상 선택해야\n해요. 현재 설정된 동네를\n 변경하시겠어요?"
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedString = NSAttributedString(string: messageText, attributes: attributes)
        
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        present(alertController, animated: false, completion: nil)
    }
    
    @objc fileprivate func closeButtonDidTapWhenTwoOfOne() {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            let searchAddressVC = SearchAddressViewController()
            self.navigationController?.pushViewController(searchAddressVC, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let messageText = firstLabel.text ?? ""
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedString = NSAttributedString(string: "'\(messageText)'을 삭제하시겠어요?", attributes: attributes)
        
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        present(alertController, animated: false, completion: nil)
    }
    
    @objc fileprivate func closeButtonDidTapWhenTwoOfTwo() {
        let alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default) { _ in
            let searchAddressVC = SearchAddressViewController()
            self.navigationController?.pushViewController(searchAddressVC, animated: true)
        }
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        let messageText = secondLabel.text ?? ""
        let boldFont = UIFont.boldSystemFont(ofSize: 16)
        let attributes: [NSAttributedString.Key: Any] = [.font: boldFont]
        let attributedString = NSAttributedString(string: "'\(messageText)'을 삭제하시겠어요?", attributes: attributes)
        
        alertController.setValue(attributedString, forKey: "attributedMessage")
        
        present(alertController, animated: false, completion: nil)
    }
    
    @objc fileprivate func plusButtonDidTap() {
        let searchAddressVC = SearchAddressViewController()
        self.navigationController?.pushViewController(searchAddressVC, animated: true)
    }
}
