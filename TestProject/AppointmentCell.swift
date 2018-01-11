//
//  AppointmentCell.swift
//  TestProject
//
//  Created by Timothy Hang on 1/11/18.
//  Copyright © 2018 Patel, Sanjay. All rights reserved.
//

import UIKit

class AppointmentCell: UITableViewCell
{
  @IBOutlet weak var providerFirstNameTextField: UITextField!
  @IBOutlet weak var providerLastNameTextField: UITextField!
  @IBOutlet weak var providerSpecialtyTextField: UITextField!
  @IBOutlet weak var dateAndTimeTextField: UITextField!
  @IBOutlet weak var addressTextField: UITextField!
  @IBOutlet weak var profileImage: UIImage!
  
  override func awakeFromNib()
  {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool)
  {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}
