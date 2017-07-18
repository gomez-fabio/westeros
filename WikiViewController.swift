//
//  WikiViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 17/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class WikiViewController: UIViewController {

    
    @IBOutlet weak var activityView: UIActivityIndicatorView!
    @IBOutlet weak var browserView: UIWebView!
    
    let model  : House
    
    init(model : House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        
    }
    
    // chapuza infame de apple. se pone y punto.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func syncViewWithModel(){
        
        activityView.isHidden = false
        activityView.startAnimating()
        title = model.name
        browserView.delegate = self
        browserView.loadRequest(URLRequest(url: model.wikiURL))
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        syncViewWithModel()
    }

}

// Implementamos el protocolo de delegado para saber cuando termina el UIWebView y ocultar el activity
extension WikiViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
        activityView.stopAnimating()
        activityView.isHidden = true
    }
    
    // Bloqueamos navegación por enlaces y envío de formularios
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        if (navigationType == .linkClicked) ||
           (navigationType == .formSubmitted) {
            return false
        }
        else{
            return true
        }
    }
    
    
}

