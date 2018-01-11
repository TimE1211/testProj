//
//  ViewController.swift
//  TestProject
//
//  Created by Patel, Sanjay on 3/31/17.
//  Copyright © 2017 Patel, Sanjay. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
  var appointments = [Appointment]()
  let formatter = DateFormatter()
  let today = Date()
  var upcomingAppointments = [Appointment]()
  var pastAppointments = [Appointment]()
  var pastAsthmaAppointments = [Appointment]()
  
  @IBOutlet weak var tableView: UITableView!

  override func viewDidLoad()
  {
    super.viewDidLoad()
    formatter.dateStyle = .medium
    formatter.timeStyle = .medium
    for anApointment in appointments
    {
      if anApointment.dateAndTime! < today
      {
        pastAppointments.append(anApointment)
      }
      else
      {
        upcomingAppointments.append(anApointment)
      }
    }
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
  }
  
  // MARK: - Table view data source
  
  func numberOfSections(in tableView: UITableView) -> Int
  {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
  {
    if section == 0
    {
      return upcomingAppointments.count
    }
    else
    {
      return pastAppointments.count
    }
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
  {
    if section == 0
    {
      return "Upcoming Appointments"
    }
    else
    {
      return "Past Appointments"
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  {
      let cell = tableView.dequeueReusableCell(withIdentifier: "UpcomingAppointmentCell", for: indexPath) as! AppointmentCell
      
      let anAppointment = appointments[indexPath.row]
      
      cell.providerFirstNameTextField.text = anAppointment.providerFirstName
      cell.providerLastNameTextField.text = anAppointment.providerLastName
      cell.providerSpecialtyTextField.text = anAppointment.providerSpecialty
      cell.dateAndTimeTextField.text = formatter.string(from: anAppointment.dateAndTime ?? today)
      cell.addressTextField.text = anAppointment.address
  //    cell.profileImage.image = UIImage(cgImage: profilePicture.dms)
  
    return cell
  }
  
  // MARK: - Table view delegate
  
//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
//  {
//    tableView.deselectRow(at: indexPath, animated: true)
//
//    if let selectedCell = tableView.cellForRow(at: indexPath)
//    {
//      let selectedAppointment = appointments[indexPath.row]
////      selectedAppointment segue here to show more info on/edit selectedAppointment
//    }
//  }
  
  @IBAction func asthmaOnlyTapped(_  sender: UIButton)
  {
    for aPastAppointment in pastAppointments
    {
      if aPastAppointment.isAsthmaAppointment == true
      {
        pastAsthmaAppointments.append(aPastAppointment)
      }
    }
  }
  
}

