//
//  PostDetailViewController.swift
//  IOSAssessment
//
//  Created by Gowri Karthik on 29/05/24.
//

import UIKit

class PostDetailViewController: UIViewController {
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    var postDetail: Post?
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "\(postDetail?.id ?? 0)"
        titleLable.text = postDetail?.title ?? ""
        contentLabel.text = postDetail?.body ?? ""
    }
}
