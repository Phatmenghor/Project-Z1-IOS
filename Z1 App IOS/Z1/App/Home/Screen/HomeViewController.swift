//
//  HomeViewController.swift
//  Z1 App Clone
//
//  Created by MacBook Pro on 24/3/23.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let imageArray = ["ImageSlide1", "ImageSlide2", "ImageSlide1", "ImageSlide2", "ImageSlide1", "ImageSlide2"]
    
    @IBOutlet var sliderCollectionView: UICollectionView!
    
    @IBOutlet var pageView: UIPageControl!
    var timer: Timer?
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureNavbar()
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        
        pageView.numberOfPages = imageArray.count
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(imageSlideView), userInfo: nil, repeats: true)
    }
    
    @objc func imageSlideView() {
        if currentIndex == imageArray.count - 1 {
            currentIndex = -1
        } else {
            currentIndex += 1
            sliderCollectionView.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
            pageView.currentPage = currentIndex
        }
    }
    
    private func configureNavbar() {
        var image = UIImage(named: "Z1Logo")
        image = image?.withRenderingMode(.alwaysOriginal)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
        
        var iconNotification = UIImage(named: "Notification")
        iconNotification = iconNotification?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(image: iconNotification, style: .done, target: self, action: nil),
            //            UIBarButtonItem(image: iconNotification, style: .done, target: self, action: nil),
        ]
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sliderCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SlideShowCollectionViewCell
        cell.slideImage.image = UIImage(named: imageArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}
