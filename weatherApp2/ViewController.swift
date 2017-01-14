//
//  ViewController.swift
//  weatherApp2
//
//  Created by WilliamCastellano on 1/12/17.
//  Copyright © 2017 WilliamCastellano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet var cityTextfield: UITextField!
  @IBOutlet var resultLabel: UILabel!
  
  @IBAction func getWeather(_ sender: Any) {
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let url = URL(string: "http://www.weather-forecast.com/locations/Miami/forecasts/latest")!
    
    let request = NSMutableURLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
      data, response, error in
      
      if error != nil {
        print(error)
      } else {
        if let unwrappedData = data {
          let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
          print(dataString)
        }
      }
    }
    task.resume()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

