//
//  ViewController.swift
//  Online Image
//
//  Created by shoeb on 12/01/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myOnlineImage: UIImageView!
    @IBOutlet weak var youOnlineImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: "https://picsum.photos/200/300.webp"){
            myOnlineImage.loadForm(url: url)
        }
        if let url1 = URL(string: "https://picsum.photos/seed/picsum/200/300"){
            youOnlineImage.loadForm(url: url1)
        }
    }
}

extension UIImageView {
    func loadForm(url : URL){
        let task = URLSession.shared.dataTask(with: url){ data, response, error in
            guard let data = data, let imageView = UIImage(data: data) else{
                print("Could not load image from url \(url)")
                return
            }
            DispatchQueue.main.async {
                self.image = imageView
            }
        }
        task.resume()
    }
}
