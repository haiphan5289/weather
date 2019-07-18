//
//  home_cell.swift
//  weather_app
//
//  Created by HaiPhan on 7/8/19.
//  Copyright © 2019 HaiPhan. All rights reserved.
//

import UIKit

class home_cell: UITableViewCell {
    var today_lb: UILabel!
    var today_separator: UIView!
    var temperature_lb: UILabel!
    var img: UIImageView!
    var temperature_seperator: UIView!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: "cell")
        setup_view()
    }
    
    func setup_view(){
        today_lb_setup_autolayout()
        today_separator_setup_autolayout()
        temperature_lb_setup_autolayout()
        temperature_seperator_setup_autolayout()
        img_setup_autolayout()
    }
    
    func img_setup_autolayout(){
        img = UIImageView()
        img.image = UIImage(named: "loading")
        img.contentMode = .scaleToFill
        self.addSubview(img)
        
        img.translatesAutoresizingMaskIntoConstraints = false
        img.leftAnchor.constraint(equalTo: temperature_seperator.rightAnchor, constant: 8).isActive = true
        img.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        img.widthAnchor.constraint(equalToConstant: 100).isActive = true
        img.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func temperature_seperator_setup_autolayout(){
        temperature_seperator = UIView()
        temperature_seperator.backgroundColor = UIColor.darkGray
        self.addSubview(temperature_seperator)
        
        temperature_seperator.translatesAutoresizingMaskIntoConstraints = false
        temperature_seperator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        temperature_seperator.leftAnchor.constraint(equalTo: temperature_lb.rightAnchor, constant: 8).isActive = true
        temperature_seperator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        temperature_seperator.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func temperature_lb_setup_autolayout(){
        temperature_lb = UILabel()
        temperature_lb.text = "40 - 50"
        temperature_lb.textAlignment = .center
        temperature_lb.font = UIFont(name: "SFUIDisplayRegular", size: 16)
        self.addSubview(temperature_lb)
        
        temperature_lb.translatesAutoresizingMaskIntoConstraints = false
        temperature_lb.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        temperature_lb.leftAnchor.constraint(equalTo: today_separator.rightAnchor, constant: 8).isActive = true
        temperature_lb.widthAnchor.constraint(equalToConstant: 100).isActive = true
        temperature_lb.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    func today_separator_setup_autolayout(){
        today_separator = UIView()
        today_separator.backgroundColor = UIColor.darkGray
        self.addSubview(today_separator)
        
        today_separator.translatesAutoresizingMaskIntoConstraints = false
        today_separator.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        today_separator.leftAnchor.constraint(equalTo: today_lb.rightAnchor, constant: 8).isActive = true
        today_separator.widthAnchor.constraint(equalToConstant: 1).isActive = true
        today_separator.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func today_lb_setup_autolayout(){
        today_lb = UILabel()
        today_lb.text = "Today"
        today_lb.textAlignment = .center
        today_lb.font = UIFont(name: "SFUIDisplayRegular", size: 16)
        self.addSubview(today_lb)
        
        today_lb.translatesAutoresizingMaskIntoConstraints = false
        today_lb.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        today_lb.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        today_lb.widthAnchor.constraint(equalToConstant: 100).isActive = true
        today_lb.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
