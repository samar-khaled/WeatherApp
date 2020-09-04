//
//  ViewController.swift
//  WeatherApp
//
//  Created by Samar Khaled on 9/3/20.
//  Copyright © 2020 Samar Khaled. All rights reserved.
//

import UIKit

class WeatherSearchViewController: UIViewController {
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
        textField.placeholder = "Please enter a City/state/country/zipcode/etc"
        return textField
    }()

    let goButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Go!", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14.0, weight: .semibold)
        return button
    }()

    // MARK: - Variables
    let viewModel = WeatherSearchViewModel()
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
        layoutGoButton()
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

    private func layoutGoButton() {
        controlsView.addSubview(goButton)
        let goButtonHeight: CGFloat = 32.0
        let goButtonWidth: CGFloat = 200.0
        goButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: marginConstant).isActive = true
        goButton.heightAnchor.constraint(equalToConstant: goButtonHeight).isActive = true
        goButton.centerXAnchor.constraint(equalTo: controlsView.centerXAnchor).isActive = true
        goButton.widthAnchor.constraint(equalToConstant: goButtonWidth).isActive = true
        goButton.addTarget(self, action: #selector(goAction(_:)), for: .touchUpInside)
    }

    private func showError(error: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let alert = UIAlertController.init(title: "Error", message: error, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

    private func showLoadingView() -> UIViewController {
        let spinnerViewController = SpinnerViewController()
        self.addViewController(viewController: spinnerViewController)
        return spinnerViewController
    }

    private func hideLoadingView(loadingView: UIViewController) {
        self.removeViewController(viewController: loadingView)
    }

    // MARK: - Actions
    @IBAction func goAction(_ sender: UIButton) {
        searchTextField.resignFirstResponder()
        let loadingView = showLoadingView()
        viewModel.search(userInput: searchTextField.text ?? "") { [weak self] (result) in
            guard let self = self else { return }
            self.hideLoadingView(loadingView: loadingView)
            switch result {
            case .failure(let error):
                self.showError(error: error.message)
            case .success(_):
                break
            }
        }
    }
}
