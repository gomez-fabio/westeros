//
//  HouseViewController.swift
//  Westeros
//
//  Created by Fabio Gomez on 11/7/17.
//  Copyright © 2017 Fabio Gomez. All rights reserved.
//

import UIKit

class HouseViewController: UIViewController {
    
    @IBOutlet weak var houseNameView: UILabel!
    @IBOutlet weak var wordsView: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    
    // Propiedad para el modelo
    let model : House
    
    // Inicializador
    init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)  // Init designado de UIViewController
        self.title = model.name                // Title de los controladores, hay que colocarlo después de tenerlo todo inicializado
    }
    
    // Ñapa de apple, lo ponemos y punto, relacionado con que no que haya nils...
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Sincronizamos vista y modelo
    func syncViewWithModel(){
        houseNameView.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsView.text = model.words
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        syncViewWithModel()
    }
}
