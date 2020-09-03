//
//  ViewController.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Constants
    let marginConstant: CGFloat = 8

    // MARK: - Controls
    let controlsView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        label.textColor = .blue
        label.text = "Welcome to the weather app"
        return label
    }()

    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textAlignment = .left
        textField.font = UIFont.systemFont(ofSize: 13.0, weight: .regular)
        textField.textColor = .blue
        textField.backgroundColor = .white
        textField.borderStyle = .roundedRect
        textField.placeholder = "Please enter a City/state/country/etc)"
        return textField
    }()

    // MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutControls()
    }

    // MARK: - Private func
    private func layoutControls() {
        layoutControlView()
        layoutWelcomeLabel()
        layoutSearchTextField()
    }

    private func layoutControlView() {
        view.addSubview(controlsView)
        let controlsViewHeight: CGFloat = 300.0
        let controlsViewWidthMargin: CGFloat = -32
        controlsView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        controlsView.heightAnchor.constraint(equalToConstant: controlsViewHeight).isActive = true
        controlsView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        controlsView.widthAnchor.constraint(
            equalTo: view.widthAnchor,
            constant: controlsViewWidthMargin
        ).isActive = true
    }

    private func layoutWelcomeLabel() {
        controlsView.addSubview(welcomeLabel)
        let welcomeLabelHeight: CGFloat = 24.0
        welcomeLabel.topAnchor.constraint(equalTo: controlsView.topAnchor, constant: marginConstant).isActive = true
        welcomeLabel.heightAnchor.constraint(equalToConstant: welcomeLabelHeight).isActive = true
        welcomeLabel.leftAnchor.constraint(equalTo: controlsView.leftAnchor, constant: marginConstant).isActive = true
        welcomeLabel.rightAnchor.constraint(equalTo: controlsView.rightAnchor, constant: marginConstant).isActive = true
    }

    private func layoutSearchTextField() {
        controlsView.addSubview(searchTextField)
        let searchTextFieldHeight: CGFloat = 32.0
        searchTextField.topAnchor.constraint(
            equalTo: welcomeLabel.bottomAnchor,
            constant: marginConstant).isActive = true
        searchTextField.heightAnchor.constraint(equalToConstant: searchTextFieldHeight).isActive = true
        searchTextField.leftAnchor.constraint(
            equalTo: controlsView.leftAnchor,
            constant: marginConstant).isActive = true
        searchTextField.rightAnchor.constraint(
            equalTo: controlsView.rightAnchor,
            constant: -marginConstant).isActive = true
    }
}
