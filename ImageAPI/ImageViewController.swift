//  ImageViewController.swift
//  ImageAPI


import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var albumLabel: UILabel!
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var thumbnailLabel: UILabel!
    
    var image: ImageAPIRequest?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        albumLabel.text = "\((image?.albumID)!)"
        idLabel.text = "\((image?.id)!)"
        titleLabel.text = image?.title
        thumbnailLabel.text = image?.thumbnailURL
    }
}
