//  Created by Nekokoatl on 09/02/16.


import UIKit

class WebViewVC: UIViewController {

    
    @IBOutlet weak var webpageview: UIWebView!
    
    var theUrl = "http://vk.com/id187769790"
    
    func loadWebPage() {
        let myUrl = URL (string: "theURL")
        let theRequest = URLRequest (url: myUrl!)
        webpageview.loadRequest(theRequest)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadWebPage()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    



}
