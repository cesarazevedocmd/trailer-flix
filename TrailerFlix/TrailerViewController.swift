//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by César Alves de Azevedo on 04/12/20.
//

import UIKit

class TrailerViewController: UIViewController {
    
    var trailer: Trailer!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadTrailer()
    }
    
    func loadTrailer() {
        ivPoster.image = UIImage(named: "\(trailer.poster)")
        lbTitle.text = trailer.title
        lbYear.text = "Lançado em \(trailer.year)"
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
