Nov. 30, 2018
Ricky Binhai Hu
CS214

Project 3

I affirm that I have not given or received any unauthorized help on this assignment, and that this work is my own.


This is an app that allows user to look up driver and record his/her own rating. Why this is useful or helpful is currently unclear. This app slightly differs from the original proposal in that no image is displayed and search feature is removed.

This project meets all requirements as demonstrated below:

* User defaults:
In 'Profile', you can submit a name and an email. Both are persisted in UserDefaults.

* Localization:
English and Simplified Chinese are supported.

* Codable data persistence:
You can add drivers on the root view. Any driver you add will be persisted as Codable. 

* URLSession with dataTask:
This app uses a server endpoint that I implemented. This is a public endpoint and no API key is needed. This endpoint accepts a name parameter and returns a randomly generated description of the driver. Click on any driver cell from the root view and this description will be fetched on displayed in the driver profile view.

* Sectioned table:
The root view is a table view with 2 sections.

* 2 Alerts:
1. New driver can be added from root view through an alert window.
2. Click on any driver cell from root view to go to driver profile view. In driver profile view, double tap to reset your rating - this will trigger a notification alert.

# 2 Gestures:
In the driver profile view (accessed through clicking on driver cell from root view), your rating for this driver is displayed on the right bottom corner.
1. double tap to reset your rating to 5.
2. swipe down to lower your rating by 1.

# CoreLocation:
CoreLocation is used in the profile view. If you're using simulator, please set your location and allow location permission request.
