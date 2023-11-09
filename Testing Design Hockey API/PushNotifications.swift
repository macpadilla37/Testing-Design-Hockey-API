//
//  PushNotifications.swift
//  Testing Design Hockey API
//
//  Created by Mac Padilla on 11/9/23.
//

import Foundation
import NotificationCenter

class PushNotificationService {
    var isPermissionGranted = false

    func requestPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                self.isPermissionGranted = true
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }

    func scheduleNotification(title: String, subtitle: String) {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = title
        notificationContent.subtitle = subtitle
        let trigger = UNCalendarNotificationTrigger(dateMatching: .init(year: 2023, month: 11, day: 13, hour: 20, minute: 0), repeats: true)
        let notificationRequest = UNNotificationRequest(identifier: UUID().uuidString, content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(notificationRequest)
    }
    
    func clearNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
}
