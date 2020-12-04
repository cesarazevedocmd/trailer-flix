//
//  ViewController.swift
//  TrailerFlix
//
//  Created by César Alves de Azevedo on 04/12/20.
//

import UIKit

class ViewController: UIViewController {
    
    let trailersManager = TrailersManager.share
    var trailerToPlay: Trailer!
    
    
    @IBOutlet weak var tvTrailers: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trailersManager.loadTrailers()
        tvTrailers.delegate = self
        tvTrailers.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TrailerViewController {
            vc.trailer = trailerToPlay
        }
    }
    
    @IBAction func showRandomTrailer(_ sender: UIButton) {
        showTrailer(with: trailersManager.getRandomTrailer())
    }
    
    
    func showTrailer(with trailer: Trailer){
        trailerToPlay = trailer
        performSegue(withIdentifier: "trailerSegue", sender: nil)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trailersManager.trailers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let trailer = trailersManager.getTrailer(indexPath.row)
        cell.textLabel?.text = trailer.title
        cell.detailTextLabel?.text = String(trailer.year)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showTrailer(with: trailersManager.getTrailer(indexPath.row))
    }
}
