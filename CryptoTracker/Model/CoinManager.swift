//
//  CoinManager.swift
//  CryptoTracker
//
//  Created by sehio on 23.08.2021.
//

import Foundation

protocol CoinManagerDelegate {
    func coinReceived(_: Double?, string: String?)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "DCA2632A-A81D-............"
    var delegate:CoinManagerDelegate?
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    
    func getCoinPrice(for currency: String)  {
        
        let urlString = baseURL+currency+"?apikey="+apiKey
        let url = URL(string: urlString)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { data,resp,error in
            
            let forCurrency = currency
            
            if error != nil {
                print(error!)
                return
            }
            
            if let data = data {
                let decoder = JSONDecoder()
                do {
                  let decodedData = try decoder.decode(Rate.self, from: data)
                  print("\(decodedData.rate)")
                  delegate?.coinReceived(decodedData.rate, string: forCurrency)
                } catch {
                  print(error)
                }
            }
            
        }
        task.resume()
        
    }
}
