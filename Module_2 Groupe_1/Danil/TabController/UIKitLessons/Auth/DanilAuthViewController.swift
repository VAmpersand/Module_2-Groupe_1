//
//  DanilAuthViewController.swift
//  Module_2 Groupe_1
//
//  Created by Danil Demchenko on 10.09.2022.
//

import UIKit
import SnapKit

final class DanilAuthViewController: UIViewController {
    
    private let pickerDataSize = 10000
    private let topView = TopView()
    private let stepper = CustomStepper()
    private let dateTextField = PickerTextField(placeholderText: "Birth of Date")
    private let eventTextField = PickerTextField(placeholderText: "Event, place")
    private let picker = UIPickerView()
    private let dataSource = [
        [
            "Best friend's birthday",
            "Football match",
            "Concert",
            "IOS lesson",
            "Consultation",
            "Going to the cinema"
        ],
        [
            "City stadium",
            "Zoom",
            "Youtube broadcast",
            "Gym",
            "University",
            "Movie theater",
            "Nightclub",
            "Central park",
            "Restaurant",
            "Sports centre",
            "Library",
            "Countryside",
        ]
    ]
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.datePickerMode = .date
        datePicker.minimumDate = Calendar.current.date(byAdding: .year, value: -90, to: Date())
        return datePicker
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 18
        return stackView
    }()
    
    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        addSubviews()
        addConstraints()
    }
    
    private func configureAppearance() {
        view.backgroundColor = Constants.Color.primary
        
        setupEventPicker()
        
        dateTextField.inputView = datePicker
        datePicker.addTarget(self, action: #selector(datePickerHandler), for: .valueChanged)
        stepper.addTarget(self, action: #selector(stepperHandler), for: .valueChanged)
    }
    
    private func addSubviews() {
        [
            topView,
            stackView,
            stepper
        ].forEach(view.addSubview)
        
        [
            dateTextField,
            eventTextField,
        ].forEach(stackView.addArrangedSubview)
    }
    
    private func addConstraints() {
        topView.snp.makeConstraints {
            $0.top.trailing.leading.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.38)
        }
        
        stackView.snp.makeConstraints {
            $0.top.equalTo(topView.snp.bottom).offset(Constants.Paddings.large)
            $0.leading.trailing.equalToSuperview().inset(Constants.Paddings.large)
        }
        
        dateTextField.snp.makeConstraints {
            $0.height.equalTo(58)
        }
        
        eventTextField.snp.makeConstraints {
            $0.height.equalTo(dateTextField)
        }
        
        stepper.snp.makeConstraints {
            $0.top.equalTo(eventTextField.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(Constants.Paddings.large)
        }
    }
    
    private func setupEventPicker() {
        picker.delegate = self
        picker.dataSource = self
        (0..<dataSource.count).forEach {
            picker.selectRow((pickerDataSize / 2) * dataSource[$0].count, inComponent: $0, animated: false)
        }
        eventTextField.inputView = picker
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true)
    }
}

@objc extension DanilAuthViewController {
    private func stepperHandler() {
        print(stepper.currentValue)
    }
    
    private func datePickerHandler(_ datePicker: UIDatePicker) {
        dateTextField.text = dateFormatter.string(from: datePicker.date)
    }
}

extension DanilAuthViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        pickerDataSize * dataSource[component].count
    }
}

extension DanilAuthViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[component][row % dataSource[component].count]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentIndex = row % dataSource[component].count
        picker.selectRow(
            (pickerDataSize / 2) * dataSource[component].count + currentIndex, inComponent: component, animated: false
        )
        let arr = (0..<dataSource.count).map {
            dataSource[$0][pickerView.selectedRow(inComponent: $0) % dataSource[$0].count]
        }
        eventTextField.text = arr.joined(separator: ", ")
    }
}
