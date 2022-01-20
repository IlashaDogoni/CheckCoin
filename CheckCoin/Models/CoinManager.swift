//
//  CoinManager.swift
//  CheckCoin
//
//  Created by Ilya Kokorin on 19.01.2022.
//

import Foundation

struct CoinManager{
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC/"
    let apiKey = "?apikey=3D66FE59-E8BB-4035-A2D6-A020DE9B9FF7"
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let neededCurrency = currency
        print(neededCurrency)
        let urlString = baseURL + neededCurrency + apiKey
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil{
                 //   delegate?.didFailedWithError(error: error!)
                    print("Error!")
                    return
                }
                if let safeData = data{
                    let coin = parseJSON(safeData)!
                    print(coin)
                  //  print("GOT DATA")
               //   print(safeData)
                  //  var backToString = String(data: safeData, encoding: String.Encoding.utf8) as String??
                 //  print(backToString)
                 //   print(urlString)
                    }
                }
            task.resume()
            }
    }
    
    
    func parseJSON(_ coinData: Data) -> Double? {
        let decoder = JSONDecoder()
        do{
        let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let realPrice = decodedData.rate
            return realPrice
           
        } catch {
          //  delegate?.didFailedWithError(error: error)
            return nil
        }
    }
    
    
    
    
}
