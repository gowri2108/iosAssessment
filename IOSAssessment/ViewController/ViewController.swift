//
//  ViewController.swift
//  IOSAssessment
//
//  Created by Gowri Karthik on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
    // Table View
    @IBOutlet weak var postTableView: UITableView!
    // Post
    var posts: [Post] = []
    // Current Page
    var currentPage = 1
    // Limit
    let limit = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAPI()
        postTableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "PostTableViewCell")
    }
    
    func callAPI() {
        guard var urlComponents = URLComponents(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "_page", value: "\(currentPage)"),
            URLQueryItem(name: "_limit", value: "\(limit)")
        ]
        
        guard let url = urlComponents.url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let newPosts = try JSONDecoder().decode([Post].self, from: data)
                self.posts.append(contentsOf: newPosts)
                DispatchQueue.main.async {
                    self.postTableView.reloadData()
                }
                
            } catch let error {
                print("Error decoding JSON: \(error)")
            }
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell else { return UITableViewCell.init()}
        let post = posts[indexPath.row]
        cell.titleLabel.text = "\(post.id) - \(post.title)"
        cell.contentLabel.text = post.body
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == posts.count - 1 {
            currentPage += 1
            callAPI()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "PostDetailViewController") as? PostDetailViewController
        vc?.postDetail = posts[indexPath.row]
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
