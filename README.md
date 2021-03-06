Original App Design Project - README Template
===

# VacayToday

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
VacayToday is an iOS application that provides travel planning and managing features. Your friends can get access to the shared plan and update travel details day by day such as: 
* Travel dates
* Departure & arrival locations
* Events
* Transportation 
* Food
* Lodging
* Places
* Expenses

Users can also share their own travel plans and view other users' public plans to favorite and save to get more travel ideas! 

### App Evaluation
- **Category:** Travel
- **Mobile:** Location, social
- **Story:**
- **Market:** Provides huge value to **gen Zs** who love to share their traveling experience, benefit **family/group of friends** to keep track of travel planning
- **Habit**: Average users would both create and consume
- **Scope:** It is challenging but doable within 5 weeks. The stripped-down version of this app would include creating and publishing travel plans and exploring other users' plans.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

1. [x] User can create a new account
2. [x] User can login 
3. User can logout
4. [x] User can create a profile
5. [x] User can create a trip folder 
6. User can create trip details inside the folder
7. [x] User can switch between sub-tabs to view Itinerary (default), Lodging, Food, Transportation, Places
8. [x] User can view and scroll through a list of activities (in Itinerary Tab), places (in Place Tab), and lodging (in Lodging Tab)
9. User can track expenses at different places on trip itinerary / Each tabs keep track of expenses, itinerary sums it up (choose 1)
10. User can add friends and give them permission to modify specific travel plans
11. User can choose to publish their folder 
12. [x] User can explore other peole's trip folders
13. User can like others folders
14. User can save the folders for later visit.

**Optional Nice-to-have Stories**

1. User can use others' files as a template
2. User can publish photos of their travel
3. User can link items in internary to items in other tabs
4. User can link their bookings from other applications to their travel folders

### App Walkthrough GIF

<img src="http://g.recordit.co/lAteqU7M0x.gif" width=250><br>
<img src="http://g.recordit.co/ANnAIz0bOX.gif" width=250><br>

![ezgif com-gif-maker](https://user-images.githubusercontent.com/32797557/166179043-605598c1-b2d6-4cfc-b02b-65aac60333d3.gif)

### 2. Screen Archetypes
* Launch Screen
    * User can see app logo
* Login/Register Screen
   * User can login and signup
* Stream Screens
   * Home - user can view created folders
   * Explore - user can view other's folders
   * Profile - Saved Travel Plans - user can view saved travel plan List
* Detail Screens
    * Home - Itinerary Subtab
   * Home - Lodging Subtab
   * Home - Food Subtab
   * Home - Transportation Subtab
   * Home - Places Subtab
   * Explore - Shared Folder Detail
* Profile Screen
   * User views their profile pic, saved folders and can log out

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home
* Explore
* Profile

**Flow Navigation** (Screen to Screen)

* Home
   * Trip List Screen 
   * Trip Detail 
       * Itinerary (default)
           * Edit Modal
       * Lodging
           * Edit Modal
       * Food
           * Edit Modal
       * Transportation
           * Edit Modal
       * Places
           * Edit Modal
* Explore
   * Explore List Screen
   * Explore Trip Detail
       * Itinerary (default)
       * Lodging
       * Food
       * Transportation
       * Places
* Profile
   * Profile Detail
       * Saved Travel Plans 
           * Saved Travel Plan Detail

## Wireframes
[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 

### Models
#### USER

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | user_id      | String   | unique id of the user account|
   | username      | String| account username |
   | password      | String     | account password |
   | profile_image        | File   | account profile image uploaded by user|

#### TRIP

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | trip_id      | String   | unique id of the trip|
   | name    | String     | trip title |
   | description | String   | trip description |
   | start_on | DataTime   | trip start date |
   | end_on | DateTime   | trip end date |
   | num_people | Number   | number of people on the trip |
   | likes | Number   | number of likes |
   | is_published | Boolean   | whether the trip folder is public |
   | created_by   | Pointer to USER | id of user who created the trip|
   | created_on   | DateTime | date when trip is created|
   | trip_zip_id   | Pointer to TRIP_ZIP | id of the trip and a location in the trip pairing|
   | thumb_url | String | url of thumbnail illustration|
   
#### TRIP_ZIP

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | trip_zip_id      | String   | unique id of the trip and zipcode pairing|
   | trip_id    | Pointer to TRIP   | id of the trip |
   | zip | String | zipcode of a location of the trip |
   
#### USER_TRIP

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | user_trip_id      | String   | unique id of the trip and the user who can edit it pairing|
   | user_id    | Pointer to USER     | id of user who has access to the trip |
   | trip_id    | Pointer to TRIP     | id of the trip |

#### USER_SAVED_TRIP

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | user_saved_trip_id      | String   | unique id of the trip and the user who saves it pairing |
   | user_id    | Pointer to USER     | id of user who saves the trip |
   | trip_id    | Pointer to TRIP     | trip id |
     
#### ACTIVITY

   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | act_id      | String   | unique id of the trip activity|
   | trip_id | Pointer to TRIP | trip id of trip where this activity belongs to |
   | cat_id | Pointer to CATEGORY | category id of the activity |
   | act_title | String | activity title |
   | act_description | String | detail about the activity |
   | location_name | String | name of location |
   | location_address | String | address of location |
   | location_contact | String | contact (phone/email) of location |
   | act_from | DateTime | when the activity starts |
   | act_to   | DateTime | when the activity ends |
   | is_booked | Boolean | whether a booking is made for the activity |
   | thumb_url | String | thumbnail url |
   | url  | String | additional url to a relevant site |
   | trans_mode | String | transportation mode |
   | rating | Number | user's food rating (0 to 5)|
   | recommendation | String | user's food recommendation |
   | group_expense | Number| group pay of the activity |
   | paid_by | Pointer to USER | id of the user to pay the group expense in the activity|
   | note | String | addition note about the activity|
   
#### CATEGORY
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | cat_id  | String   | unique id of the activity category|
   | cat      | String   | category name|
   
#### USER_ACT
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | user_act_id  | String   | unique id of the user and activity pairing|
   | user_id      | Pointer to USER   | id of the user who is involved in the activity|
   | act_id      | Pointer to ACTIVITY | id of the activity|
   | ind_expense | Number | individual expense paid by a user for the activity
   
#### GROUP_PAY_ACT
   | Property      | Type     | Description |
   | ------------- | -------- | ------------|
   | group_pay_act_id  | String   | unique id of the user and group pay from the activity pairing|
   | owed_by      | Pointer to USER   | id of the user who is involved in the group pay in the activity|
   | act_id      | Pointer to ACTIVITY | id of the activity|

### Networking
* Login Screen:
    - POST: Log in
    - POST: Sign up
* Home
   * Trip List Screen
       - GET: Get the trip list
       - POST: 
           - Create a new trip
           - Publish trip
           - Unpublish trip
       - DELETE: Delete a trip
       - PUT: 
           - Update a trip info
   * Trip Detail 
       * Itinerary (default)
           * GET: Get a trip's itinerary activities
           * POST: Create a new activity in a trip
           * DELETE: Delete an activity in a trip
           * PUT: Update an activity information in a trip
       * Lodging
           * GET: Get a trip's lodging records
           * POST: Create a new lodging record in a trip
           * DELETE: Delete a lodging record in a trip
           * PUT: Update a lodging record information in a trip
       * Food
           * GET: Get a trip'seating records
           * POST: Create a new eating record
           * DELETE: Delete an eating record
           * PUT: Update an eating record information
       * Transportation
           * GET: Get a trip's transportation records
           * POST: Create a new transportation record in a trip
           * DELETE: Delete a transportation record in a trip
           * PUT: Update a transportation record in a tripinformation
       * Places
           * GET: Get a trip's places
           * POST: Create a new place in a trip
           * DELETE: Delete a place in a trip
           * PUT: Update a place's information in a trip
* Explore
   * Explore List Screen
       * GET: 
           * Get public trips
           * Search trips by filter and order criteria
       * POST: 
           * Like trip
           * Unlike trip
           * Save trip
           * Unsave trip
   * Explore Trip Detail
       * Itinerary (default)
           * GET: Get a trip's itinerary activities
       * Lodging
           * GET: Get a trip's lodging records
       * Food
           * GET: Get a trip's eating records
       * Transportation
           * GET: Get a trip's transportation records
       * Places
           * GET: Get a trip's places
* Profile
   * Profile Detail
       * GET: Get user information
       * POST: Log out
   * Saved Travel Plans 
       * GET: Get user's saved explored trip list
       * POST: Save trip
       * POST: Unsave trip
   * Saved Travel Plan Detail
       * Itinerary (default)
           * GET: Get a trip's itinerary activities
       * Lodging
           * GET: Get a trip's lodging records
       * Food
           * GET: Get a trip's eating records
       * Transportation
           * GET: Get a trip's transportation records
       * Places
           * GET: Get a trip's places

* Example network code snippet:
```
    // iOS
    // (Read/GET) Query all posts where user is author
    let query = PFQuery(className:"Post")
    query.whereKey("author", equalTo: currentUser)
    query.order(byDescending: "createdAt")
    query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
       if let error = error {
          print(error.localizedDescription)
       } else if let posts = posts {
          print("Successfully retrieved \(posts.count) posts.")
          // TODO: Do something with posts...
       }
    }
```
