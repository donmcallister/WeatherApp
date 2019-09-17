//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Donald McAllister on 9/17/19.
//  Copyright © 2019 Donald McAllister. All rights reserved.
//

import UIKit

class WeatherView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
      //  self.addSubview(backgroundView)
        self.addSubview(mainStackView)
        conditionsImageStackView.addArrangedSubview(conditionsImageView)
        mainStackView.addArrangedSubview(conditionsImageStackView)
        
        mainStackView.addArrangedSubview(centerContentStackView)
        centerContentStackView.addArrangedSubview(temperatureLabel)
        centerContentStackView.addArrangedSubview(cityAndConditionsStackView)
        
        cityAndConditionsStackView.addArrangedSubview(cityLabel)
        cityAndConditionsStackView.addArrangedSubview(conditionsLabel)
        
        mainStackView.addArrangedSubview(buttonStackView)
        buttonStackView.addArrangedSubview(UIView(frame: .zero))
        buttonStackView.addArrangedSubview(celsiusButton)
        buttonStackView.addArrangedSubview(fahrenheitButton)
        buttonStackView.addArrangedSubview(UIView(frame: .zero))
    }
    
    private func setupConstraints() {
       // backgroundView.fillSuperview()
        mainStackView.anchor(top: safeAreaLayoutGuide.topAnchor, leading: leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 30, bottom: 30, right: 30))
    }
    
//let backgroundView: UIView = {
//    let view = UIView()
//    view.backgroundColor = .red
//    return view
//}()

let mainStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.distribution = .equalSpacing
    stackView.spacing = 10
    return stackView
}()
    
    let conditionsImageStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .trailing
        stackView.spacing = 10
        return stackView
    }()
    
    let cityAndConditionsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()

let temperatureLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 144)
    label.textColor = .white
    label.textAlignment = .center
    label.text = "18°"
    return label
}()

let cityLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 36)
    label.textColor = .white
    label.textAlignment = .center
    label.text = "Charlotte"
    return label
}()

let conditionsLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 20)
    label.textColor = .white
    label.textAlignment = .center
    label.text = "Sunny"
    return label
}()

let conditionsImageView: UIImageView = {
    let image = UIImage(named: "sun")
    let imageView = UIImageView(image: image)
    imageView.contentMode = .scaleAspectFit
    imageView.widthAnchor.constraint(equalToConstant: image!.size.width).isActive = true
    imageView.heightAnchor.constraint(equalToConstant: image!.size.height).isActive = true
    return imageView
}()

    let centerContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 60
        stackView.alignment = .center
        return stackView
    }()
    
let celsiusButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("°C", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 73)
    button.setTitleColor(.white, for: .normal)
    return button
}()

let fahrenheitButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("°F", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: 73)
    button.setTitleColor(.white, for: .normal)
    return button
}()

let buttonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.distribution = .equalCentering
    stackView.spacing = 10
    return stackView
}()
    
}

extension WeatherView {
    var gradientLayer: CAGradientLayer {
        return self.layer as! CAGradientLayer
    }
    override class var layerClass: AnyClass {
        return CAGradientLayer.classForCoder()
    }
    
    func updateGradient(_ colors: [CGColor]) {
        gradientLayer.colors = colors
    }
}
