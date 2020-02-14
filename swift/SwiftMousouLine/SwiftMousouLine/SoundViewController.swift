//
//  SoundViewController.swift
//  SwiftMousouLine
//
//  Created by 福島拓希 on 2020/02/12.
//  Copyright © 2020 福島拓希. All rights reserved.
//

import UIKit
import AVFoundation

class SoundViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var imageView2: UIImageView!
    
    var audioPlayer : AVAudioPlayer!
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 非表示
        imageView2.isHidden = true
        timeLabel.isHidden = true
        
        playMp3(target: "callMusic")
    }
    
    @IBAction func takePhone(_ sender: Any) {
        imageView2.isHidden = false
        timeLabel.isHidden  = false
        
        // タイマースタート
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerCountUp), userInfo: nil, repeats: true)
        
        playMp3(target:"baby")
        
    }
    
    /// MP３ファイルの再生処理
    /// - parameter target: 再生したいファイル名
    func playMp3(target:String) {
        // mp3を再生する
        if let url = Bundle.main.url(forResource: target, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: url)
                audioPlayer.play()
            } catch {
                audioPlayer = nil
            }
        } else {
            fatalError("Url is nil")
        }
    }
    
    @objc func timerCountUp() {
        count += 1
        timeLabel.text = String(count)
    }
    
    @IBAction func closePhone(_ sender: Any) {
        // 電話を切る
        
        audioPlayer?.stop()
        
        // モーダルウインドウを閉じる
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
