//
//  ViewController.swift
//  CheckCoin
//
//  Created by Ilya Kokorin on 19.01.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    
    let coinManager = CoinManager()
    
    

    @IBOutlet var bitcoinLabel: UILabel!
    @IBOutlet var currencyLabbel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
       
    }
    
    
    //MARK: - UIPickerVIewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedCurrency = coinManager.currencyArray[row]
        coinManager.getCoinPrice(for: selectedCurrency)
    }

    

}

