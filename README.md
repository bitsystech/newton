# newton - The Mac Enrolment App v2.0
💻 Mac Enrolment App for Medium and Large Organizations 🖥

This is 2nd release. Feel free to download and modify as needed.
<img src="http://img.techpowerup.org/171227/screen-shot-2017-12-27-at-19-54-46.png" width="888" height="629">


<b>Main Sections in GUI:</b>
  
<b>1. Select Location:</b> If you manage multiple locations / offices. Keep your AD profile or AD Binding script here that will bind Mac to specific OU. If you don't have multiple locations, you can list the OU codes here. The location is parsed as input in the script.

<b>2. Enter Mac Name:</b> As the name suggests, it does not need clarification. This part of the script is automated, nothing that you would want to modify. It just renames the Mac.
* There is a great idea though, which I would work on late 2018/ early 2019. You can create a central server with Machine name list in different SQL tables. Based on the location / OU you have selected in step 1, this will fetch the machine name in specific format for that location. In other words, assigning names to Macs can be fully automated. :)

<b>3. Start Button:</b> This will begin the process.

<b>4. Stages:</b> This can be renamed in Xcode as you wish. You can create script for every stage and keep in /usr/local/EYM/ folder. Every step will execute the script and once completed successfully, it will show a green checkbox and move to next step.
<i>Changing the step display names:</i> Open the app in XCode. Go to Main.storyboard & change the names by double clicking, in GUI.

<b>5. Logs:</b> Logs can be seen from the Log menu in App. I know this is very amateur way of logging, but I did not have enough time to waste in that. Please use advance Logging methods rather than relying on this echo output thing. This will by default creat a log.txt file at this location: /usr/local/EYM/
I would still recommend to do a comprehensive logging in the script itself.

<b>Running the App:</b> You need to be admin in order to run the Newton. As the first account on Mac is Admin by default, you don't need to worry if you are enrolling a new Mac.

<b>Script Names:</b> Look inside ViewController.m file. You have options to change everything as you want it to be. If it looks complex, you can stick with same names and change your script to this name.

<b>Customizing the Header:</b> If you want your company logo, replace the header file inside Supporting Files folder. Resolution: 2400x401
Also the footer image can be changed as well. Resolution is 1800x50.

<b>Customizing Build Date / Version:</b> Version at bottom left can be changed as you do (4) Stages.

<b>Customizing Helpdesk Number:</b> Same as Customizing (4) Stages.

--------------------------------------------------------------------------------------------

This document is first draft. Probably it needs modification and changes, however the app is working great. Please use and suggest enhancement, fixes and bugs. We would love to reach a 'Stable State' that can help the entire Mac community. 

                                                                                   ❤️ Tweet me @LaeeqHumam

