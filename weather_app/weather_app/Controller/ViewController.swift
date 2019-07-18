//
//  ViewController.swift
//  weather_app
//
//  Created by HaiPhan on 7/8/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var key_api = "https://api.darksky.net/forecast/ad559877ebffe80c1fdd3e81c943faf9/10.765785,106.693486"
    var tb_weather: UITableView!
    var navi_bar: UINavigationBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        setup_view()
    }
    
    func setup_view(){
        navi_bar_setup_autolayout()
        tb_weather_setup_autolayout()
    }

    func tb_weather_setup_autolayout(){
        tb_weather = UITableView()
//        tb_weather.backgroundColor = UIColor.red
        self.view.addSubview(tb_weather)
        
        tb_weather.translatesAutoresizingMaskIntoConstraints = false
        tb_weather.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        tb_weather.topAnchor.constraint(equalTo: self.navi_bar.bottomAnchor, constant: 0).isActive = true
        tb_weather.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        tb_weather.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        
        tb_weather.delegate = self
        tb_weather.dataSource = self
        tb_weather.register(home_cell.self, forCellReuseIdentifier: "cell")
    }
    
    func navi_bar_setup_autolayout(){
        navi_bar = UINavigationBar(frame: CGRect(x: 0, y: 20, width: self.view.frame.width, height: 100))
//        navi_bar.backgroundColor = UIColor.red
        navi_bar.prefersLargeTitles = true
        self.view.addSubview(navi_bar)
        
        UIApplication.shared.statusBarStyle = .default
        navi_bar.barTintColor = UIColor(red: 51/255, green: 91/255, blue: 161/255, alpha: 1)
        navi_bar.isTranslucent = false
        navi_bar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red: 7/255, green: 25/255, blue: 30/255, alpha: 1), NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)]
        
        let navi_item: UINavigationItem = UINavigationItem(title: "Forecast")
        navi_item.largeTitleDisplayMode = .always
        navi_bar.setItems([navi_item], animated: true)
        
        let view_status = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 20))
        view_status.backgroundColor = UIColor(red: 51/255, green: 91/255, blue: 161/255, alpha: 1)
        self.view.addSubview(view_status)
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tb_weather.dequeueReusableCell(withIdentifier: "cell") as! home_cell
//        cell.backgroundColor = UIColor.black
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
