//
//  detailVC.swift
//  Ataev
//
//  Created by Атаев Магарам Никматулаевич on 27/2/2023.
//

import UIKit
import SwiftyJSON
import Alamofire
class detailVC: UIViewController {
    
    var cityName = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colotTop = UIColor(red: 89/255, green: 156/255, blue: 169/255, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0).cgColor
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [colotTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        self.view.layer.addSublayer(gradientLayer)
        
    }
    
    func currentWeather(city: String){
        let url = "http://api.weatherapi.com/v1/current.json?key=117e7078c7f542d08e792141232002&q=London&aqi=no\(city)"
        
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                let neme = json["location"]["name"].stringValue
                let temp = String(json["current"]["temp_c"].doubleValue)
                let country = json["location"]["country"].stringValue
                let weatherURLString = "http:";\(json["location"][0]["icon"].stringValue)"
                
                self.cityNameLabel.text = name
                self.temp_c.text = String(temp)
                self.countryLabel.text = country
                
                let weatherURL = URL(string: weatherURLString)
                if let data = try? Data(contentsOf: weatherURL!){
                    self.imageWeather.image = UIImage(data: data)
                    
                }
                
                
            case .failure(let error):
                print(error)
            }
        }
        
        
    }
}
