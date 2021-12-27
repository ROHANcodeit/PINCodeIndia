//
//  PinManager.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 26/12/21.
//

import UIKit

protocol pinManagerDelegate {
    func didUpdatePin(_ pinManager: PinManager, pin: PinModel)
    func didFailWithError(error: Error)
}

class PinManager{
   
    let postalURL="https://api.postalpincode.in/pincode/"
    
    func fetchName(pin: String){
        let urlString = "\(postalURL)\(pin)"
        performRequest(with: urlString)
    }
    var delegate: pinManagerDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let pin = self.parseJSON(safeData) {
                        self.delegate?.didUpdatePin(self, pin: pin)
                    }
//                    let dataString=String(data:safeData,encoding: .utf8)
//                    print(dataString)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ pinData: Data)->PinModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData:[MainData] = try decoder.decode([MainData].self,from: pinData)
            let name = decodedData[0].PostOffice[0].Name//.PostOffice[0].Name
            
            let pin = PinModel(Name: name)
            return pin
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
