//
//  ZoomViewController.swift
//  NewsFeed
//
//  Created by Yash Jivani on 17/06/21.
//

import UIKit

class ZoomViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollVie: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = image
        imageView.frame.size = imageView.image!.size
        
        scrollVie.delegate = self
        setZoomParameters(scrollVie.bounds.size)
        centerImage()
        
    }
    
    override func viewWillLayoutSubviews() {
        setZoomParameters(scrollVie.bounds.size)
        centerImage()
    }
    
    func centerImage(){
        let scrollViewSize = scrollVie.bounds.size
        let imageSize = imageView.frame.size
        let horizontalSpace = imageSize.width < scrollViewSize.width ? (scrollViewSize.width - imageSize.width) / 2 : 0
        
        let verticalSpace = imageSize.width < scrollViewSize.height ? (scrollViewSize.height - imageSize.height) / 2 : 0
        scrollVie.contentInset = UIEdgeInsets(top: verticalSpace, left: horizontalSpace, bottom: verticalSpace, right: horizontalSpace)
    }
    
    func setZoomParameters(_ scrollViewSize: CGSize){
        let imageSize = imageView.bounds.size
        let widthScale = scrollViewSize.width / imageSize.width
        let heightScale = scrollViewSize.height / imageSize.height
        let minScale = min(widthScale, heightScale)
        
        scrollVie.minimumZoomScale = minScale
        scrollVie.maximumZoomScale = 3.0
        scrollVie.zoomScale = minScale
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    

}
