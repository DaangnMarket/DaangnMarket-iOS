//
//  WriteUsedViewController.swift
//  DaangnMarket
//
//  Created by sei on 2023/05/06.
//

import UIKit
import PhotosUI
import SnapKit
import Then


protocol WriteUsedViewControllerDelegate: AnyObject {
  func selectImage(image: UIImage)
}


final class WriteUsedViewController: UIViewController {
    
    enum CommonTableViewSetting {
        static let edgeInsets = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    // MARK: - UI Components
    
    private lazy var writeTableView: UITableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorInset = CommonTableViewSetting.edgeInsets
        $0.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: $0.frame.width, height: 1))
    }
    
    // MARK: - Properties
    
    weak var delegate: WriteUsedViewControllerDelegate?
    
    private var picker: PHPickerViewController {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 10
        configuration.filter = .images
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        return picker
    }
    
    var uploadImages = [UIImage]()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setNavigationBar()
        setLayout()
        setDelegate()
        register()
    }
    
    // 꼭 이렇게 해야할까?
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let cell = writeTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? WritePhotosCell else {
          print("guard fail")
          return
        }
        cell.addImageView.delegate = self
        self.delegate = cell
    }
}


extension WriteUsedViewController {
    
    // MARK: - Custom Methods
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationBar() {
        setNavigationLeftBarButton()
        setNavigationTitle()
        setNavigationRightBarButton()
    }
    
    private func setNavigationLeftBarButton() {
        let backBarButton = UIBarButtonItem(
            image: UIImage(systemName: "multiply"),
            style: .plain,
            target: self,
            action: #selector(closeButtonDidTap))
        backBarButton.tintColor = .black
        
        navigationItem.leftBarButtonItem = backBarButton
    }
    
    private func setNavigationTitle() {
        navigationItem.title = "내 물건 팔기"
    }
    
    private func setNavigationRightBarButton() {
        let createBarButton = UIBarButtonItem(
            title: "완료",
            style: .plain,
            target: self,
            action: #selector(createButtonDidTap))
        createBarButton.tintColor = UIColor.daangnOrange
        navigationItem.rightBarButtonItem = createBarButton
    }
    
    private func setLayout() {
        view.addSubview(writeTableView)
        
        writeTableView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        writeTableView.dataSource = self
        writeTableView.delegate = self
    }
    
    private func register() {
        writeTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        writeTableView.register(WritePhotosCell.self, forCellReuseIdentifier: WritePhotosCell.cellIdentifier)
        writeTableView.register(WriteTitleTextCell.self, forCellReuseIdentifier: WriteTitleTextCell.cellIdentifier)
        writeTableView.register(WritePriceTextCell.self, forCellReuseIdentifier: WritePriceTextCell.cellIdentifier)
        writeTableView.register(WriteDescriptionTextCell.self, forCellReuseIdentifier: WriteDescriptionTextCell.cellIdentifier)
    }
    
    // MARK: - @objc Methods
    
    @objc private func closeButtonDidTap() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func createButtonDidTap() {
        print("create button did tap")
    }
}

// MARK: - UITableViewDataSource

extension WriteUsedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: WritePhotosCell.cellIdentifier, for: indexPath) as! WritePhotosCell
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: WriteTitleTextCell.cellIdentifier, for: indexPath) as! WriteTitleTextCell
        case 2:
            cell = defaultCell(content: "카테고리", indexPath: indexPath)
            cell.accessoryType = .checkmark
        case 3:
            cell = tableView.dequeueReusableCell(withIdentifier: WritePriceTextCell.cellIdentifier, for: indexPath) as! WritePriceTextCell
        case 4:
            cell = tableView.dequeueReusableCell(withIdentifier: WriteDescriptionTextCell.cellIdentifier, for: indexPath) as! WriteDescriptionTextCell
        default:
            cell = defaultCell(content: "개발중...", indexPath: indexPath)
        }
        cell.selectionStyle = .none
        return cell
    }
    
    private func defaultCell(content: String, indexPath: IndexPath) -> UITableViewCell {
        let cell = writeTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = content
        cell.textLabel?.textColor = .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? CGFloat(90) : UITableView.automaticDimension
    }
}


// MARK: - UITableViewDelegate

extension WriteUsedViewController: UITableViewDelegate {
    
}


// MARK: - PHPickerViewControllerDelegate

extension WriteUsedViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {

        picker.dismiss(animated: true)
        
        // TODO: - 순서대로 넣기
        results.forEach { result in
            let itemProvider = result.itemProvider
            if itemProvider.canLoadObject(ofClass: UIImage.self) {
                itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                    DispatchQueue.main.async {
                        self.delegate?.selectImage(image: image as! UIImage)
                    }
                }
            }
        }
    }
}


// MARK: - AddImageViewDelegate

extension WriteUsedViewController: AddImageViewDelegate {
    func openPicker() {
        present(picker, animated: true)
    }
}
