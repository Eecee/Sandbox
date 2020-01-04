//
//  ViewController.swift
//  DaysPlaner
//
//  Created by eec on 02.01.2020.
//  Copyright © 2020 eec. All rights reserved.
//

import UIKit

extension Date
{
    func toString(dateFormat format : String) -> String
    {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: self)
    }
}

class ViewController: UIViewController
{
    @IBOutlet weak var _finalDate: UILabel!
    @IBOutlet weak var _switchDaysWeeks: UISwitch!
    @IBOutlet weak var _addDaysWeeks: UITextField!
    @IBOutlet weak var _startDate: UIDatePicker!

    @IBOutlet weak var _datePickerHeader: UILabel!
    @IBOutlet weak var _daysWeeksHeader: UILabel!
    @IBOutlet weak var _finalDateHeader: UILabel!
    @IBOutlet weak var _switchDaysWeeksHeader: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        _addDaysWeeks.text = String(100)
        _datePickerHeader.text = "Start date:"
        _daysWeeksHeader.text = "Amount of days/weeks:"
        _switchDaysWeeksHeader.text = "D/W:"
        _finalDateHeader.text = "Final date:"
        
        UpdateDates()
    }
    
    @IBAction func DateChanged(_ sender: UIDatePicker)
    {
        UpdateDates()
    }
    
    @IBAction func DaysWeeksEditingChanged(_ sender:UITextField)
    {
        UpdateDates()
    }
    
    @IBAction func SwitchDaysWeeksChanged(_ sender: Any)
    {
        UpdateDates()
    }
    
    func UpdateDates()
    {
        let addValue : Int? = Int(_addDaysWeeks.text ?? "")
        if (addValue == nil) { return }

        var dateCompoent = DateComponents()
        dateCompoent.day = _switchDaysWeeks.isOn ? addValue! : addValue! * 7
        
        let newDate : Date = Calendar.current.date(byAdding: dateCompoent, to: _startDate.date)!
        _finalDate.text = newDate.toString(dateFormat: "dd-MM-YYYY")
    }
}

