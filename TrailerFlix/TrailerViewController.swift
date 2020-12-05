//
//  TrailerViewController.swift
//  TrailerFlix
//
//  Created by César Alves de Azevedo on 04/12/20.
//

import UIKit
import AVFoundation
import AVKit

class TrailerViewController: UIViewController {
    
    var trailer: Trailer!
    @IBOutlet weak var ivPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbYear: UILabel!
    @IBOutlet weak var lbRating: UILabel!
    @IBOutlet weak var viTrailer: UIView!
    
    var player: AVPlayer!
    var playerControler: AVPlayerViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareView()
        preparePlayer()
    }
    
    func prepareView() {
        ivPoster.image = UIImage(named: "\(trailer.poster)-large")
        lbTitle.text = trailer.title
        lbYear.text = "Lançado em \(trailer.year)"
        var rating = "Not rated yet"
        if trailer.rating > 0 {
            rating = ""
            for _ in 1...trailer.rating {
                rating += "⭐️"
            }
        }
        lbRating.text = rating
    }
    
    func preparePlayer(){
        player = AVPlayer(url: URL(string: trailer.url)!)
        playerControler = AVPlayerViewController()
        playerControler.player = player
        playerControler.showsPlaybackControls = true
        playerControler.player?.play()
        playerControler.view.frame = viTrailer.bounds
        viTrailer.addSubview(playerControler.view)
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
