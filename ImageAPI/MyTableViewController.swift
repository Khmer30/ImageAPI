//
//  MyTableViewController.swift
//  ImageAPI
//
//  Created by Joy Marie on 11/1/22.
//

import UIKit

class MyTableViewController: UITableViewController {

    var images = [ImageAPIRequest]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://jsonplaceholder.typicode.com/photos")!
        Task {
            do {
               let photos = try await fetchImage(from: url)
                images = photos
                self.tableView.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    func fetchImage(from url: URL) async throws -> [ImageAPIRequest] {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ResponseError.invalidImageData
        }
// MARK: this code below for single image
//        guard let image = UIImage(data: data) else {
//            throw ResponseError.invalidImageData
//        }
        
        let jsonDecoder = JSONDecoder()
        return  try! jsonDecoder.decode([ImageAPIRequest].self, from: data)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PhotoTableViewCell  = (tableView.dequeueReusableCell(withIdentifier: "showImage", for: indexPath) as! PhotoTableViewCell?)!
        let photo = images[indexPath.row]
//        cell.textLabel?.text = photo.thumbnailURL
        
        let data = getData(from: URL(string: photo.url)!) { data, response, error in
            let newImage = UIImage(data: data!)
            DispatchQueue.main.async {
                cell.photoImageView?.image = newImage
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ImageViewController {
            destination.image = images[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
            URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
        }
}
