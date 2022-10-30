//
//  ViewController.swift
//  ImageAPI


import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var images = [ImageAPIRequest]()

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
//
//    var urlRequest: URLRequest {
//        var urlCompoents = URLComponents(string: "https://jsonplaceholder.typicode.com/photos")!
//       urlCompoents.queryItems = [URLQueryItem(name: "albumId", value: "albumID"),
//                         URLQueryItem(name: "thumbnailUrl", value: "mbnailURL")]
//
//        return URLRequest(url: urlCompoents.url!)
//    }
    
    func fetchImage(from url: URL) async throws -> UIImage {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw ResponseError.invalidImageData
        }
        
        guard let image = UIImage(data: data) else {
            throw ResponseError.invalidImageData
        }
        
//        let jsonDecoder = JSONDecoder()
//        let imageIpiRequest = try! jsonDecoder.decode(ImageAPIRequest.self, from: data)
        
        return image
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showImage", for: indexPath)
        
        return cell
    }
}
