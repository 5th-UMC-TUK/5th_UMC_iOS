//
//  ViewController.swift
//  week5_mission
//
//  Created by Subeen on 2023/10/31.
//

import UIKit

final class ViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
       var st = UIStackView(arrangedSubviews: [tempLabel, minTempLabel, maxTempLabel])
        st.axis = .vertical
        return st
    }()
    
    
    private lazy var iconImageView: UIImageView = {
        var img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var tempLabel: UILabel = {
        var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "tmpLb"
        lb.textColor = .black
        return lb
    }()
    
    private lazy var maxTempLabel: UILabel = {
       var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "max"
        lb.textColor = .black
        return lb
    }()
    private lazy var minTempLabel: UILabel = {
       var lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "min"
        lb.textColor = .black
        return lb
    }()
    
    
    
    
    // 받아온 데이터를 저장할 프로퍼티
    var weather: Weather?
    var main:
    Main?
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
        
        // data fetch
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse):
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.setWeatherUI()
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
    
    private func setWeatherUI() {
//        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
//        let data = try? Data(contentsOf: url!)
//        if let data = data {
//            iconImageView.image = UIImage(data: data)
//        }
        tempLabel.text = "\(main!.temp)"
        maxTempLabel.text = "\(main!.temp_max)"
        minTempLabel.text = "\(main!.temp_min)"
    }
    
    func setConstraints() {
//        view.addSubview(iconImageView)
//        view.addSubview(tempLabel)
//        view.addSubview(maxTempLabel)
//        view.addSubview(minTempLabel)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
        ])
    }
}
