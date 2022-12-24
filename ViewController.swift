//
//  ViewController.swift
//  Currency Converter
//
//  Created by Rahil Gandhi on 2022-06-09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var convertbutton: UIButton!
    @IBOutlet weak var selectfromcur: UIButton!
    @IBOutlet weak var tocurrencylabel: UILabel!
    @IBOutlet weak var selecttocr: UIButton!
    @IBOutlet weak var fromcurrencytextfield: UITextField!
    
    var currencyconvertratedict = ["AED":3.67173,"AFN":89.629077,"ALL":114.556792,"AMD":431.030761,"ANG":1.819674,"AOA":435.613431,"ARS":122.701358,"AUD":1.424159,"AWG":1.800466,"AZN":1.699741,"BAM":1.865119,"BBD":1.999426,"BDT":93.900929,"BGN":1.859183,"BHD":0.381897,"BIF":2076.579349,"BMD":0.999593,"BND":1.394791,"BOB":6.952894,"BRL":4.984035,"BSD":1.000097,"BTC":0.000039,"BTN":78.559571,"BWP":12.188816,"BYN":3.409466,"BZD":2.036074,"CAD":1.280628,"CDF":2019.697708,"CHF":0.989471,"CLF":0.030969,"CLP":844.216644,"CNH":6.752976,"CNY":6.734479,"COP":3887.610491,"CRC":693.316538,"CUC":0.999535,"CUP":25.737816,"CVE":105.218435,"CZK":23.529844,"DJF":179.765854,"DKK":7.086854,"DOP":55.536708,"DZD":146.447058,"EGP":18.882921,"ERN":14.993423,"ETB":52.527291,"EUR":0.953309,"FJD":2.183647,"FKP":0.814161,"GBP":0.814265,"GEL":2.913473,"GGP":0.814397,"GHS":8.00322,"GIP":0.813685,"GMD":54.023983,"GNF":8938.617929,"GTQ":7.802057,"GYD":211.38845,"HKD":7.846448,"HNL":24.809593,"HRK":7.171296,"HTG":115.615751,"HUF":379.323219,"IDR":14668.433194,"ILS":3.413684,"IMP":0.814099,"INR":78.187791,"IQD":1473.888959,"IRR":42329.251338,"ISK":132.15531,"JEP":0.814145,"JMD":154.872196,"JOD":0.709544,"JPY":134.952678,"KES":118.203112,"KGS":79.466112,"KHR":4101.512357,"KMF":468.020711,"KPW":899.559648,"KRW":1284.431534,"KWD":0.30715,"KYD":0.841903,"KZT":440.524189,"LAK":14536.127609,"LBP":1526.93452,"LKR":362.008361,"LRD":151.926523,"LSL":15.752277,"LYD":4.82752,"MAD":10.009759,"MDL":19.243605,"MGA":4093.545982,"MKD":58.736688,"MMK":1869.581361,"MNT":3101.860659,"MOP":8.164501,"MRU":36.77684,"MUR":44.228764,"MVR":15.852522,"MWK":1031.559651,"MXN":20.100165,"MYR":4.413294,"MZN":63.868701,"NAD":15.852325,"NGN":414.926738,"NIO":36.20001,"NOK":9.767119,"NPR":125.693359,"NZD":1.577527,"OMR":0.386395,"PAB":1.00005,"PEN":3.795078,"PGK":3.604106,"PHP":53.218394,"PKR":204.225521,"PLN":4.399461,"PYG":6927.601548,"QAR":3.688231,"RON":4.69726,"RSD":111.505902,"RUB":57.072392,"RWF":1038.636688,"SAR":3.75105,"SBD":8.110632,"SCR":14.239569,"SDG":456.276907,"SEK":10.060065,"SGD":1.389606,"SHP":0.81378,"SLL":13123.567756,"SOS":584.117756,"SRD":21.760434,"SSP":130.196791,"STD":23251.602874,"STN":23.488988,"SVC":8.836083,"SYP":2511.298956,"SZL":15.751277,"THB":34.778497,"TJS":11.108405,"TMT":3.498334,"TND":3.069082,"TOP":2.324287,"TRY":17.223909,"TTD":6.863273,"TWD":29.729263,"TZS":2352.69934,"UAH":29.835471,"UGX":3726.33216,"USD":1,"UYU":39.892101,"UZS":11113.268521,"VES":5.244922,"VND":23198.563183,"VUV":115.002475,"WST":2.618022,"XAF":624.885978,"XAG":0.045959,"XAU":0.001641,"XCD":2.70239,"XDR":0.730162,"XOF":624.886187,"XPD":0.0017,"XPF":113.680332,"XPT":0.00128,"YER":250.127427,"ZAR":15.973101,"ZMW":17.0909,"ZWL":321.842753]
    
    
    
    var fromcurrency = " "
    var tocurrency = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func selectfromcurrencybuttonaction(_ sender: Any) {
        //show currencies
        let sheet = UIAlertController(title: "Select From Currency", message: nil, preferredStyle: .actionSheet)
        for key in self.currencyconvertratedict.keys{
            let action = UIAlertAction(title: key, style: .default){ [self](action)in
                self.fromcurrency = key
                self.selectfromcur.setTitle(key, for: .normal)
                self.tocurrencylabel.text = " "
            }
            sheet.addAction(action)
        }
        
        self.present(sheet,animated: true,completion: nil)
        
    }
    
    @IBAction func selecttocurrencybuttonaction(_ sender: Any) {
        
        
        //show currencies
        let sheet = UIAlertController(title: "Select to Currency", message: nil, preferredStyle: .actionSheet)
        for key in self.currencyconvertratedict.keys{
            let action = UIAlertAction(title: key, style: .default){ [self](action)in
                self.tocurrency = key
                self.selecttocr.setTitle(key, for: .normal)
            }
            sheet.addAction(action)
        }
        
        self.present(sheet,animated: true,completion: nil)
        
    
        
    }
    
    @IBAction func convertbuttonaction(_ sender: Any) {
        //Convert from Currency to USD
        
        if let fromCurrencyRate = currencyconvertratedict[fromcurrency],let tocurrnecyrate = currencyconvertratedict[tocurrency], let textFieldVal = fromcurrencytextfield.text, let val: Double = Double(textFieldVal){
            let usdVal = 1.0/fromCurrencyRate
            let toCurrencyVal = tocurrnecyrate * usdVal
            let totalVal = val*toCurrencyVal
            self.tocurrencylabel.text = String(totalVal)
            
            
            
            
            
            
        }
        
        
        
    }
    
}

