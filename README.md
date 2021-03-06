# openCX-your Rate-A-Talk Development Report

Welcome to the documentation pages of the Rate-A-Talk of openCX!

You can find here detailed about Rate-A-Talk, hereby mentioned as module, from a high-level vision to low-level implementation decisions, a kind of Software Development Report , organized by discipline (as of RUP):

* Business modeling 
  * [Product Vision](#Product-Vision)
  * [Elevator Pitch](#Elevator-Pitch)
* Requirements
  * [Use Case Diagram](#Use-case-diagram)
  * [User stories](#User-stories)
  * [Domain model](#Domain-model)
* Architecture and Design
  * [Logical architecture](#Logical-architecture)
  * [Physical architecture](#Physical-architecture)
  * [Prototype](#Prototype)
* [Implementation](#Implementation)
* [Test](#Test)
* [Configuration and change management](#Configuration-and-change-management)
* [Project management](#Project-management)


So far, contributions are exclusively made by the initial team, but we hope to open them to the community, in all areas and topics: requirements, technologies, development, experimentation, testing, etc.

Please contact us!

Thank you!

[João Matos](https://github.com/MechJM)

[Juliane Marubayashi](https://github.com/Jumaruba)

[Ricardo Nunes](https://github.com/TitanicThompson1)

[Rui Pinto](https://github.com/2dukes)

[Tiago Gomes](https://github.com/TiagooGomess)


----

## Product Vision
People use Rate-A-Talk app to share and fetch the most popular talks.


----
## Elevator Pitch

Do you ever get overwhelmed by the quantity of talks and how scattered they are through social media?

Rate-A-Talk aims to make your life simpler and provide a platform where you can discover the best talks suited for you!
In the app, you can find all kinds of talks, from Machine Learning to Perfomative Arts. But what sets us apart from the competition is the ability to rank the talks and their speakers in a colaborative way! Thus, you can find the best speakers to listen from.

So, what are you waiting for? Sign up today!


---
## Requirements

<br>

## Use case Diagram

![UseCase Diagram](UserCase/UserCase.png)

<br>

### Search for a talk

* **Actor**: Attendee
* **Description**: Allows the user to search for a talk post. The user can search by name, location, or even date. The search redirects the user to the post of the talk
* **Preconditions and Postconditions**: The user may want to learn more about a talk, like the date and location. After the search, he/she will know everything about it.
* **Normal Flow**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Types and sends the name of the talk
    * **System**: Searches in the database for the talk, and returns the results.
* **Alternative Flows and Exceptions**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Clicks on one of the suggestions.
    * **System**: Searches in the database for the talk, and returns the results.

<br>

### Rate a talk

* **Actor**: Attendee
* **Description**: Allows the user to rate a talk that he/she attended. After the talk, the attendee will be able to rate from 1 star (very bad), to a maximum of 5 start (excellent). 
* **Preconditions and Postconditions**: The user wants to rate a speaker. After rating, the app processes the rating and displays the new speaker rating.
* **Normal Flow**:
    * **User**: After the talk, clicks on the link given by
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Types and sends the name of the talk
    * **System**: Searches in the database for the talk, and returns the results.
* **Alternative Flows and Exceptions**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Clicks on one of the suggestions.
    * **System**: Searches in the database for the talk, and returns the results.

<br>


### Add a talk

* **Actor**: Speaker
* **Description**: Allows a speaker to create a talk. The speaker introduces information about the talk, like the date, place, duration and other speakers. When finished, the post of the talk will be accessible to all other users.
* **Preconditions and Postconditions**: The speaker wants to create a talk to let other users know about it
* **Normal Flow**:
    * **User**: Click on create post button
    * **System**: Directs the user to the Create Conference Page
    * **User**: Adds the information needed and clicks on create talk
    * **System**: Adds the talk to the database.
    Redirects the user to a Done it! page
* **Alternative Flows and Exceptions**:
   * **User**: Click on create post button
    * **System**: Directs the user to the Create Conference Page
    * **User**: Adds the information needed and clicks on create talk
    * **System**: Verifies that a talk with the same Title, Date and Place exists. Throws an error

<br>

## User Stories

### Story #1
As a user I want to be able to rate a talk so that other users can evaluate the talk's quality

### User interface mock-up

##### Button to leave a rating
![leave_rating](./docs/leave_rating_mockup.png)

##### Screen where the user can actually leave the rating
![actually_leave_rating](./docs/actually_leave_rating_mockup.png)

### Acceptance tests
```Gherkin
Scenario: Rate a talk.
  Given The post of a talk that I have attended
  When I tap "Rate talk"
  And I insert a rate
  And I tap "OK",
  Then the talk's post appears
```

### Value and effort
* Value: Must have
* Effort: XL

### Story #2
As a user I want to be able to leave a comment about the talk so that I can give feedback to the speakers and organizers

### User interface mock-up

##### Button to leave a comment
![leave_comment](./docs/leave_comment_mockup.png)

##### Screen where the user can actually leave the comment
![actually_leave_comment](./docs/actually_leave_comment_mockup.png)

### Acceptance tests
```Gherkin
Scenario: Leave a comment about a talk
  Given A talk's post that I have attended and rated
  When I tap "Leave a comment"
  And I tap "Comment"
  And I write "Hey that was great!"
  And I tap "Leave Comment"
  And I tap "See all comments"
  Then my comment appears
```
### Value and effort
* Value: Must have
* Effort: XL


### Story #3
As a user I want to be able to see the current rating of a talk so that I can make the decision if I want to attend it

### User interface mock-up
![rating](./docs/leave_rating_mockup.png)

### Acceptance tests
```Gherkin
Scenario: See rating of a talk
  Given A talk's post that is presented in the feed
  When I am in the talk's post
  Then the current rating appears
```

### Value and effort
* Value: Must have
* Effort: M


### Story #4
As a user I want to be able to edit the given rating to a talk so that I can correct possibles errors I made in the previous rating

### User interface mock-up

##### Button to leave the new rating
![leave_rating](./docs/leave_rating_mockup.png)

##### Screen where the user actually can leave the new rating
![actually_leave_rating](./docs/actually_leave_rating_mockup.png)

### Acceptance tests
```Gherkin
Scenario: Edit rating of a talk
  Given A post of a talk that I have rated
  When I tap "Rate talk"
  And I insert a rate
  And I tap "OK",
  Then the talk's post appears
```

### Value and effort
* Value: Must have
* Effort: M


### Story #5
As a user I want to be able to edit my talks post so that it can reflect the most current and up to date information about my talk 

### User interface mock-up
##### Button to edit the talk post

![Button of edit post](./docs/edit_post.PNG)



##### Edit post screen

![Button of edit post](./docs/edit_post2.PNG)



### Acceptance tests
```Gherkin
Scenario: Edit talk's post
  Given A talk's post that was created by me
  When I tap "Edit post"
  And I write "Windows" in "Title"
  And I tap "Submit"
  Then I am in feed screen
```

### Value and effort
* Value: Could have
* Effort: M


### Story #6
As a user I want to be able to edit my profile so that I can update my current information or correct errors in it

### User interface mock-up
![edit_profile](./docs/edit_profile_mockup.png)

### Acceptance tests
```Gherkin
Scenario: Edit the user profile
  Given My profile screen
  When I tap "Edit Profile" button
  And I write "pickipicki" in "New Name"
  And I tap "Submit"
  Then "pickipicki" appears
```

### Value and effort
* Value: Could have
* Effort: M

### Story #7
As a user I want to be able to insert a query in the search bar, get matching results and interact with them so that I can look up talks that I might be interested in

### User interface mock-up
![explore](./docs/searchBar.PNG)

![explore](./docs/search.PNG)

### Acceptance tests
```Gherkin
Scenario: Search for a talk with a query
  Given The home screen
  When I tap "Search Bar"
  And I write "Por que laranjas" in "Search Bar"
  And tap the "Search" icon
  Then "Por que laranjas são gostosas?" appears
```

### Value and effort
* Value: Must have
* Effort: XL


### Story #8
As a user I want to be able to create a post for a talk so that other users can see the post and attend the talk 

### User interface mock-up
![create_conference](./docs/create_conference_mockup.png)

### Acceptance tests 
```Gherkin
Scenario: A user wants to create a post
  Given The bottom navigation bar
  When I tap "Create post"
  And I fill the necessary info to create a post
  Then the talk's post is created
```

### Value and effort
* Value: Must have
* Effort: L


### Story #9
As a user I want to be able to interact with the feed results (pick one and go to the respective page) so that I can obtain more information about the talk I am interested in 

### User interface mock-up 

##### Feed mock-up
![feed](./docs/feed_mockup.png)
##### Talk page mock-up
![post](./docs/post_mockup.png)

### Acceptance tests 
```Gherkin
Scenario: Interacting with feed
  Given The feed screen
  When I tap a post talk 
  Then I'm taken to the talk's post
```

### Value and effort
* Value: Must have
* Effort: M

### Story #10
As a user I want to be able to check my profile so that I can see my current information

### User interface mock-up
![profile](./docs/profile_mockup.png)

### Acceptance tests
```Gherkin
Scenario: The user wants to check his information
  Given The home screen
  When I tap "Profile"
  Then My profile is presented
```

### Value and effort
* Value: Cool to have
* Effort: M

### Story #11
As a user I want to be able to see the comments left about a talk so that I can better comprehend its quality 

### User interface mock-up

##### Button to see all comments
![see_comments](./docs/see_comments_mockup.png)
##### Screen showing the comments
![comments](./docs/comments_mockup.png)

### Acceptance tests
```Gherkin
Scenario: The user wants to check out the comments
  Given The post talk screen
  When I tap "See all comments"
  Then The list of comments appears
```
### Value and effort
* Value: Cool to have
* Effort: M

### Story #12

As a user I want to be able to see all the talks in the app so that I can find one that satisfies me

### User interface mock-up

##### Button to see all talks
![see_talks](./docs/see_all_mockup.png)

##### Screen showing all the talks
![all_talks](./docs/all_talks_mockup.png)

### Acceptance tests
```Gherkin
Scenario: The user wants the see all talks
  Given The home screen
  When I tap "See all"
  Then A list with all the talks appears
```
### Value and effort
Value: Cool to have  
Effort: M

### Story #13

As a user I want to be able to see all the posts I created so that I can remember which talks I introduced to the app

### User interface mock-up

#### Button to see user's created talks
![created talks button](./docs/button_toSee_MyPosts_mockup.png)

#### Screen showing all created talks
![all created talks](./docs/myPosts_mockup.png)

### Acceptance tests
```Gherkin
Scenario: A user wants to see the posts he created
  Given The Profile screen
  When I tap "posts"
  Then a list of talks appears
```
### Value and effort
Value: Cool to have  
Effort: M


### Domain model

![domain_model](./docs/domain_model.png)

---

## Architecture and Design
In this section we'll describe the logical and physical architectures of our project.

### Logical architecture 
In order to provide long-term maintenance of the code and allow easy understanding about it, our project was diveded in six sections: 
- `auth`: Tasks resposible for the user athentication in the app. The login and signup backend are done by this module.  
- `database`: Communication between the firestore database and some models of the app, so as the information from the cloud can be retrieved and also uploaded.  
- `model`: Models for each structure of database.  
- `screens`: Module responsible for drawing the app and allows the iteration user/program.  
- `services`: Module that estabilish the communications between the app and FireStorage services. The main goal for this service is to upload and download stored images.  
- `widgets`: Module with useful widgets created by our team. These widgets were packet so as to be used in scale and mantain the code structure.   
## Package diagram
![](https://i.imgur.com/DrLzGr4.png)




### Physical architecture
In our app's physical architecture only 2 entities are featured: the Firebase server where the database with all the information required by the client; and the app itself, which the user interacts with.

![](./docs/physical_architecture.png)

Regarding technologies, we used Flutter (with the Dart programming language) for the frontend and Firebase for the backend because of how much they streamline the development process.

### Prototype
The following user stories were implemented:

- ##### As a user I want to be able to rate a talk so that other users can use my rating to decide if they want to attend it in the future
  - Implementation: in a talk's page there's a button that takes the user to a page where they can rate the talk
- ##### As a user I want to be able to leave a comment about the talk so that I can give feedback to the speakers and organizers
  - Implementation: in a talk's page there's a button that takes the user to a page where they can leave a comment
- ##### As a user I want to be able to see the current rating of a talk so that I can make the decision if I want to attend it
  - Implementation: in a talk's page there's a field showing the average rating
- ##### As a user I want to be able to edit the given rating to a talk so that I can correct possibles errors I made in the previous rating
  - Implementation: when a user leaves a rating by performing the steps mentioned in the the first story, it overrided any previously given rating to that talk
- ##### As a user I want to be able to edit my talks post so that it can reflect the most current and up to date information about my talk 
  - Implementation: in the page of a talk submitted by the user which is currently logged in there is a button which takes the user to a page where they can edit the talk's information
- ##### As a user I want to be able to edit my profile so that I can update my current information or correct errors in it
  - Implementation: in a user's profile screen there is a button that takes them to a page where they can edit their info
- ##### As a user I want to be able to insert a query in the search bar, get matching results and interact with them so that I can look up talks that I might be interested in
  - Implementation: the query inserted by the user in the search bar is compared with the tags, description and title of the talks in the database in order to filter the results
- ##### As a user I want to be able to create a post for a talk so that other users can see the post and attend the talk 
  - Implementation: the navigation bar at the bottom of the screen has a button which, when tapped, takes the user to a screen where they can input information about a new talk and submit it
- ##### As a user I want to be able to interact with the feed results (pick one and go to the respective page) so that I can obtain more information about the talk I am interested in 
  - Implementation: the talks shown on the feed detect when they're tapped and this event triggers a transition to the screen which shows information about the selected talk
- ##### As a user I want to be able to check my profile so that I can see my current information
  - Implementation: the navigation bar at the bottom of the screen has a button which, when tapped, takes the user to a screen where their information is shown
- ##### As a user I want to be able to see the comments left about a talk so that I can better comprehend its quality 
  - Implementation: in a talk's post there is a button which takes the user to a screen where the comments are shown
- ##### As a user I want to be able to see all the talks in the app so that I can find one that satisfies me
  - Implementation: in the feed there's a button which, when tapped, takes the user to a screen where all the talks are shown
- ##### As a user I want to be able to see all the posts I created so that I can remember which talks I introduced to the app
  - Implementation: in a user's profile there is a button which, when tapped, takes the user to a screen where all the talks submitted by them are shown

---

## Implementation 
The design of our app is straightforward. By looking at the code it's easy to understand its structure and how it was implemented.  
However, some parts of the backend will be explained, since it can be a little hard to understand the overview behind it.  
### General backend 
In general, the backend was responsible for the communication between the application and the database. Forms and display of stored information are the main operations executed for the backend.  

### Recommended talks 
The more complicated feature to be approached here is the algorithm for a recommendation. 
- First things first, a talk created by a user can't be recommended to its own creator.  
- To a conference be shown it can't have already happened.  
- The minimum rate of a conference in the recommended section is 4.  
- If the user's rating to a conference with a certain tag is >=4 in at least one conference with this tag, then it will be considered a favorite.  

---
## Test 

To test the code and the functionalities, we used *Mockito* and *Flutter_Gherkin*.

Only some features were tested. The selected ones are:

- [Recommended Conference Algorithm](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g2-codemasters/blob/master/src/test/recommended_test.dart)
- [Login screen elements](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g2-codemasters/blob/master/src/test/login_test.dart)
- [Edit Profile](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g2-codemasters/blob/master/src/test_driver/features/profile.feature)

### Unit Testing
In this test, we used *Mockito* and the default tools flutter has for tests. The tests aim the consistency of the recommended conferences algorithm and also verify the existence of some specific elements in the Login screen.

### BDD Testing

In this test, *Flutter Gherkin* was used as the testing tool. This tool requires the definition of several [steps]([./src/test_driver/steps/test_steps.dart](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g2-codemasters/blob/master/src/test_driver/steps/test_steps.dart)) in order to translate from Gherkin to Flutter. 

This test verifies if the user can edit his name.

---
## Configuration and change management 

In this project, every time a group member developed a feature, he would first create a branch dedicated to it. He would only develop the feature inside this branch, alone or with another member of the group. When the feature was done and tested, the developer creates a pull request. This pull request needs to be approved by a minimum of two group members (excluding the developer).

This management allows a better work flow for every collaborator and diminishes the total number of errors related to collaborating workspaces.


---

## Project management 

In order to facilitate team communication and organization, [GitHub Projects](https://github.com/FEUP-ESOF-2020-21/open-cx-t4g2-codemasters/projects/1) was used to do the Project Management of this project.

The project has 5 columns: **Backlog**, **To Do**, **In Progress**, **Done** and **User Stories**. These columns are quite self-explanatory. It is important to note that, at the end of any iteration, the tasks that weren't finished are passed to the next one, so that the In Progress column appears empty at the end of every iteration.
