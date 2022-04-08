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

1. User can create a new account
2. User can login 
3. User can logout
4. User can create a profile
5. User can create a trip folder 
    a. User can create trip details inside the folder
    b. User can switch between sub-tabs to view Itinerary (default), Lodging, Food, Transportation, Places
    c. User can track expenses at different places on trip itinerary / Each tabs keep track of expenses, itinerary sums it up (choose 1)
6. User can add friends and give them permission to modify specific travel plans
4. User can choose to publish their folder 
5. User can explore other peole's trip folders
6. User can like others folders
7. User can save the folders for later visit.

**Optional Nice-to-have Stories**

1. User can use others' files as a template
2. User can publish photos of their travel
3. User can link items in internary to items in other tabs
4. User can link their bookings from other applications to their travel folders

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
