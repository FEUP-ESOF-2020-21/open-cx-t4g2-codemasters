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
People use Rate-A-Talk to share and achieve new knowledge based on what the best conferences have to offer.

----
## Elevator Pitch

Do you ever get overwhelmed by the quantity of talks and conferences and how scattered they are through social media?

Rate-A-Talk aims to make your life simpler and provide a platform where you can discover the best talks suited for you!
In the app, you can find all kinds of talks, from Machine Learning to Perfomative Arts. But what sets us apart from the competition is the ability to rank the talks and their speakers! This way, you can find the best speakers to listen from.

So, what are you waiting for? Sign up today!


---
## Requirements

<br>

## Use case Diagram

![UseCase Diagram](UserCase/UserCase.png)

<br>

### Search for a conference

* **Actor**: Attendee
* **Description**: Allows the user to search for a talk post.
* **Preconditions and Postconditions**: The user may want to learn more about a talk, like the date and location. After searching, he/she will know everything about it.
* **Normal Flow**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Types and sends the name of the conference
    * **System**: Searches in the database for the conference, and returns the results.
* **Alternative Flows and Exceptions**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Clicks on one of the suggestions.
    * **System**: Searches in the database for the conference, and returns the results.

<br>

### Rate a talk

* **Actor**: Attendee
* **Description**: Allows the user to rate a talk that he/she attended.
* **Preconditions and Postconditions**: The user wants to rate a speaker. After rating, the app processes the rating and displays the new speaker rating.
* **Normal Flow**:
    * **User**: After the talk, clicks on the link given by
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Types and sends the name of the conference
    * **System**: Searches in the database for the conference, and returns the results.
* **Alternative Flows and Exceptions**:
    * **User**: Clicks in the search bar.
    * **System**: Opens the search submenu and presents the last searches from the user.
    * **User**: Clicks on one of the suggestions.
    * **System**: Searches in the database for the conference, and returns the results.

<br>


### Add a talk

* **Actor**: Speaker
* **Description**: Allows a speaker to create a talk
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
    * **System**: Verifies that a conference with the same Title, Date and Place exists. Throws an error

<br>

## User Stories

### Story #1

As a user, I want to log into the app

### User interface mockup
[a introduzir]

### Scenery
* Logging in
* **Given:** There are fields for entering the username/email and password
* **When:** The user puts their information in those fields
* **And:** The provided values are correct
* **Then:** The user is logged in

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: L


### Story #2
As a user, i want to insert my personal information and create a password for my account;

### User interface mockup
[a introduzir]

### Scenery
* Opening the app for the first time
* **Given:** There is an option for creating a new account
* **When:** The user selects that option
* **And:** Provides the information required for a profile
* **Then:**A new profile is created

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: L


### Story #3
As a user I want to be able to rate a talk

### User interface mockup
[a introduzir]

### Scenery
* Rate a talk.
* **Given:** A conference that I have attended
* **When:**I tap “Rate this talk”
* **Then:**I give a score between 0 and 10

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: XL

### Story #4
As a user I want to be able to leave a comment about the talk

### User interface mockup
[a introduzir]

### Scenery
* Leave a comment about a talk
* **Given:** A conference that I have attended and rated
* **When:** I tap “leave comment”
* **Then:** I can post a comment about that talk

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: XL


### Story #5
As a user I want to be able to see the current rating of a conference

### User interface mockup
[a introduzir]

### Scenery
* See rating of a conference
* **Given:** A conference that is presented in the feed
* **When:** I click a conference post
* **Then:** Conference rating is presented

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: M


### Story #6
As a user I want to be able to edit the given rating to a conference

### User interface mockup
[a introduzir]

### Scenery
* Edit rating of a conference
* **Given:** A conference that I have rated
* **When:** I tap “edit rating” button
* **Then:** I can modify the initial rating

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: M


### Story #7
As a user I want to be able to edit my conference’s post

### User interface mockup
[a introduzir]

### Scenery
* Edit conference’s post
* **Given:** A conference’s post that was published by me
* **When:** I tap the “edit post” button
* **And:** I change what I’ve written initially in the post
* **Then:** The information on my post changes

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Could have
* Effort: M


### Story #8
As a user I want to be able to edit my profile

### User interface mockup
[a introduzir]

### Scenery
* Edit the user profile
* **Given:** My profile
* **When:** I go to my profile
* **And:** I tap “edit profile” button
* **Then:**I should be able to edit my profile informations

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Could have
* Effort: M


### Story #9
As a user I want to be able to check which conferences a speaker participated

### User interface mockup
[a introduzir]

### Scenery
* Inspecting a speaker profile
* **Given:** The speaker profile
* **When:** I check it’s info
* **Then:** I should see which conferences a speaker participated

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Cool to
* Effort: A DEFINIR


### Story #10
As a user I want to be able to check which conferences a lecturer participated in

### User interface mockup
[a introduzir]

### Scenery
* Look up a specific conference
* **Given:** A conference that is presented in the feed
* **When:** I click a conference post
* **Then:** Conference detailed info is presented

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: L


### Story #11
As a user I want to be able to apply filters to narrow down the search results, such as (the speaker, theme, rating, etc)

### User interface mockup
[a introduzir]

### Scenery
* A user is searching for something
* **Given:** There is an option to apply filters
* **When:** The user selects the filters they want to apply
* **And:** Provides the values for each filter
* **Then:** Only results that match the provided filters are shown

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Cool to have
* Effort: M


### Story #12
As a user I want to be able to sort the search results based on several criteria

### User interface mockup
[a introduzir]

### Scenery
* A user is searching for something
* **Given:** There is an option to sort the results
* **When:** The user selects the sorting criteria
* **And:** Provides the values for each criteria (ascending/descending)
* **Then:** The results are sorted based on the provided sorting criteria

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Cool to have
* Effort: M


### Story #13
As a user I want to be able to insert a query in the search bar and get matching results

### User interface mockup
[a introduzir]

### Scenery
* A user is searching for something
* **Given:** There is search bar where I can type
* **When:** I enter some information in the search bar
* **And:** I tap the “search” button
* **Then:** Conferences and users related to what I’ve searched are shown

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: XL


### Story #14
As a user I want to be able to interact with the search results (pick one and go to the respective page)

### User interface mockup
[a introduzir]

### Scenery
* A user is looking at search results
* **Given:** The results are clickable
* **When:** The user taps a result
* **Then:** The user is taken to the page that corresponds to that result

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: L


### Story #15
As a user I want to be able to create a post for a conference

### User interface mockup
[a introduzir]

### Scenery
* A user wants to create a post
* **Given:** A button that allows them to do so
* **When:** The user taps that button
* **Then:** The user is taken to the post creation page

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: L


### Story #16
As a user I want to be able to interact with the feed results (pick one and go to the respective page)

### User interface mockup
[a introduzir]

### Scenery
* A user is looking at a feed
* **Given:** The conferences shown are clickable
* **When:** The user taps a conference
* **Then:** The user is taken to the page that corresponds to that conference

### Acceptance tests
[a introduzir]

### Value and effort
* Value: Must have
* Effort: M

TO DO


## Domain model

TO DO

---
