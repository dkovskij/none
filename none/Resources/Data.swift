/*
 See LICENSE folder for this sample’s licensing information.
 
 Abstract:
 Helpers for loading images and data.
 */

import UIKit
import SwiftUI
import CoreLocation
import Combine

let landmarkData: [Landmark] = load("landmarkData.json")
let basketData: [BasketItemModel] = []
let data = datass()

//final class myData: ObservableObject {
//    @Published var items: [BasketItemModel] = data.jsonData
//}


final class datas: ObservableObject {
    
    @Published var jsonData: [BasketItemModel] = []
    
    init () {
        let url = URL(string: "https://nocf.keng.ru/api/cart.php")!
        let session = URLSession(configuration: .default)
        var items: [BasketItemModel] = []
        
        session.dataTask(with: url) { (data, response, error) in
            //        print(data!)
            //            print(error ?? "error")
            //            print(response ?? "response")
            
            
            do {
                let json = try JSONDecoder().decode(BasketResponseModel.self, from: data!)
                items = json.items!
                
                DispatchQueue.main.async {
                    self.jsonData = items
                }
                
                //try JSONSerialization.jsonObject(with: data!, options: [])
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}

class datass {
    
    var jsonData: [BasketItemModel] = []
    
    init () {
        let url = URL(string: "https://nocf.keng.ru/api/cart.php")!
        let session = URLSession(configuration: .default)
        var items: [BasketItemModel] = []
        
        session.dataTask(with: url) { (data, response, error) in
            //        print(data!)
            //            print(error ?? "error")
            //            print(response ?? "response")
            
            
            do {
                let json = try JSONDecoder().decode(BasketResponseModel.self, from: data!)
                items = json.items!
                
                DispatchQueue.main.async {
                    self.jsonData = items
                }
                
                //try JSONSerialization.jsonObject(with: data!, options: [])
            } catch let DecodingError.dataCorrupted(context) {
                print(context)
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch let DecodingError.typeMismatch(type, context)  {
                print("Type '\(type)' mismatch:", context.debugDescription)
                print("codingPath:", context.codingPath)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        }.resume()
    }
}


//func fetchUser(userID: Int, userCompletionHandler: @escaping (User?, Error?) -> Void) {
//  let url = URL(string: "https://reqres.in/api/users/\(userID)")!
//  let task = URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
//
//    guard let data = data else { return }
//    do {
//      // parse json data and return it
//      let decoder = JSONDecoder()
//      let jsonDict = try decoder.decode([String: User].self, from: data)
//      if let userData = jsonDict["data"] {
//        userCompletionHandler(userData, nil)
//      }
//
//    } catch let parseErr {
//      print("JSON Parsing Error", parseErr)
//      userCompletionHandler(nil, parseErr)
//    }
//  })
//
//  task.resume()
//  // function will end here and return
//  // then after receiving HTTP response, the completionHandler will be called
//}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}

final class ImageStore {
    typealias _ImageDictionary = [String: CGImage]
    fileprivate var images: _ImageDictionary = [:]
    
    fileprivate static var scale = 2
    
    static var shared = ImageStore()
    
    func image(name: String) -> Image {
        let index = _guaranteeImage(name: name)
        
        return Image(images.values[index], scale: CGFloat(ImageStore.scale), label: Text(name))
    }
    
    static func loadImage(name: String) -> CGImage {
        guard
            let url = Bundle.main.url(forResource: name, withExtension: "jpg"),
            let imageSource = CGImageSourceCreateWithURL(url as NSURL, nil),
            let image = CGImageSourceCreateImageAtIndex(imageSource, 0, nil)
            else {
                fatalError("Couldn't load image \(name).jpg from main bundle.")
        }
        return image
    }
    
    fileprivate func _guaranteeImage(name: String) -> _ImageDictionary.Index {
        if let index = images.index(forKey: name) { return index }
        
        images[name] = ImageStore.loadImage(name: name)
        return images.index(forKey: name)!
    }
}
