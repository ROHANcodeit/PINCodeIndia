//
//  NameManager.swift
//  PINIndia
//
//  Created by Rohan Tyagi on 27/12/21.
//

import UIKit

protocol nameManagerDelegate {
    func didUpdateName(_ nameManager: NameManager, name: NameModel)
    func didFailWithError(error: Error)
}

class NameManager{
   
    let postalURL="https://api.postalpincode.in/pincode/"
    
    func fetchName(name: String){
        let urlString = "\(postalURL)\(name)"
        performRequest(with: urlString)
    }
    var delegate: nameManagerDelegate?
    
    func performRequest(with urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                if let safeData = data {
                    if let pincode = self.parseJSON(safeData) {
                        self.delegate?.didUpdateName(self,name:pincode)
                    }
//                    let dataString=String(data:safeData,encoding: .utf8)
//                    print(dataString)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ nameData: Data)->NameModel?{
        let decoder = JSONDecoder()
        
        do{
            let decodedData:[MainData] = try decoder.decode([MainData].self,from: nameData)
            let pin = decodedData[0].PostOffice[0].Pincode
            
            let pincode = NameModel(Pincode: pin)
            return pincode
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
        
    }
    
}
