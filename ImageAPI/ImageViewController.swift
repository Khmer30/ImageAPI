//  ImageViewController.swift
//  ImageAPI


import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var urlLabel: UILabel!
    
    var image: ImageAPIRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = image?.title
        urlLabel.text = image?.url
    }
}
