# VolunTree
_Helping to better connect volunteers and organizations._

Created for CPSC 599.83 by: Tahamina (Moon) Chowdhury, Khushi Choksi, Savitur Maharaj

The goal of VolunTree is to allow users to easily access volunteering opportunities posted by organizations. We also aim to make it easier for organizations to find volunteers and efficiently manage their volunteer platforms. 

## App Architecture
The app is organized into **3 main folders**:

1. InitialPages/ (which has the SignIn/Register/Preferences views)
2. OrganizationPages/
3. UserPages/

The OrganizationPages/ and UserPages/ folders each contain a Components/ folder and a folder for each different page. This allows us to keep everything organized and efficiently find pages.


## Using the application
Note: The application was designed using the iPhone 16 Pro screen size. Thus, the application may look different on other phone sizes. 

The initial view to start the app is at InitialPages/Starter. 
Users can register/log in, while organizations can only sign in as they need to get approved by us before receiving an account. This allows us to ensure verified organizations are on our application.

**Dummy organization login data:** 
- email: saviturmaharaj@gmail.com
- password: password

**Dummy volunteer login data:**
Please make use of the register feature to sign up for a volunteer account! 

### App flow:
1. Organization posts volunteering opportunity - implemented and can be done by clicking **+** on the initial org profile page.
2. User can request to join the volunteering opportunity - implemented on the user search view by clicking on a volunteering card.
3. The organization can approve/reject the "pending" request - implemented, but XCode sometimes gives problems when the view application button is clicked (**TO DO**: resolve this issue)
4. User can request to complete a volunteering opportunity - **TO DO**
5. Organization can confirm the user's request to complete the opportunity - **TO DO**
6. User can request a recommendation letter - **TO DO**
7. Organization can write a recommendation letter - **TO DO: implement functionality, implement AI-generated letters based on prompts**

## What is left to complete? 
These are the general and main things left to complete:
1. Implement functionality on the map view.
2. Implement chat feature.
3. Make changes to the challenges view.
4. Implement complete functionality for the user profile.
5. Incorporate the app logo throughout the app.
6. Move away from Firebase to a custom backend to avoid scaling costs (huge endeavour and should be implemented before the app gets too big).


We will continue this project over the summer and possibly the next Fall 2025 semester. In this continuation, we aim to complete all of the to-do features that were listed earlier. 

_If you're reading this and are interested in helping out with this app over Summer 2025, please shoot an email to Savitur at saviturmaharaj@gmail.com._



## Appendix A: Resources
Throughout the application's development, we made use of several resources, including Swift documentation, online articles (such as StackOverflow), video tutorials, and artificial intelligence (AI) tools like ChatGPT.

**Use of AI Tools:**
- ChatGPT - Assisted primarily in the following areas:
  - Debugging Code: Helped identify and resolve syntax errors and logic issues.
  - Styling the Frontend: Assisted with frontend styling, including animations and fixing bugs.
  - Firebase Queries: Helped with the creation and optimization of Firebase queries for backend API calls.

While AI tools played a role in assisting with technical aspects, all final code and decisions were reviewed and implemented by the team. The AI was used as a supplementary resource for learning and problem-solving (along with the other resources mentioned earlier), which was especially useful as we started learning Swift at the beginning of the semester. It helped us implement more complex features, such as animations, more effectively.
