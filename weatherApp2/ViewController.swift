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
    if let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextfield.text! + "/forecasts/latest") {
    
    let request = NSMutableURLRequest(url: url)
    
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
      data, response, error in
      
      var message = ""
      
      if error != nil {
        print(error)
      } else {
        if let unwrappedData = data {
          let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
          
          var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
          
          if let contentArray = dataString?.components(separatedBy: stringSeparator) {
            
            if contentArray.count > 0 {
              stringSeparator = "</span>"
              
              let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
              if newContentArray.count > 0 {
                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                print(message)
              }
            }
          }
        }
      }
      
      if message == "" {
        message = "The weather there is not found. Please try again."
      }
      
      DispatchQueue.main.sync(execute: {
        self.resultLabel.text = message
      })
      }
    task.resume()
    } else {
      resultLabel.text = "The weather there is not found. Please try again."
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
}

