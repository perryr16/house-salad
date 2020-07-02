# House Salad Base

This repo is used as a base for the Consuming API lesson taught in Backend Module 3. To complete the lesson you will need to sign-up for an API key from the [ProPublica Congress API](https://projects.propublica.org/api-docs/congress-api/).

### Versions

Rails 5.1.7
Ruby 2.5.3

### Setup

```bash
git clone https://github.com/turingschool-examples/house-salad-base house-salad

cd house-salad

rails db:{create,migrate}
```

### Exercise

Write a test and complete this user story

*NOTE: Please use the existing form in the application.*

```
As a user
When I visit "/"
And I select "Colorado" from the dropdown
And I click on "Locate Members of the House"
Then my path should be "/search" with "state=CO" in the parameters
And I should see a message "7 Results"
And I should see a list of the 7 members of the house for Colorado
And I should see a name, role, party, and district for each member
```

### Checks for Understanding
What is Delcaritive Programming?
* Delcaritive programming is the process of writing code that you want, and worrying about implementation later. It is essentially TDD. Start at the end point and work backwards

What is Red, Green, Refactor?
* Red, Green, Refactor is a process for writing complex code. Start by using declaritive programming to write a test. Initially that test will fail (RED). Write the code in the easiest way in order to get that test to pass, dont worry about best practices...yet (GREEN). After the tests are passing then refactor to follow the 4 pilliars of OOP, SRP, and MCV.

Controller: 
* Single Repsonsibility: A traffic cop that handles requests and only passes essential data to the view
* Does it achieve abstraction?: Yes, the controller passes the `@members` object to the view but it does not detail how `@members` is created
* Does it acheive encapsulation?: Yes, the controller itself is a capsule and the method `index` is another capsule within holding information that follows the SPR

SearchResults: 
* Single Responsibility: Given a State ('Colorado'), the serach_results will access the API service to generate member ruby objects. 
* Abstraction?: Yes, by calling `SearchResults.new.members(state)` we are given an array of member objects without having to know how they are individually generated
* Encapsulation?: Yes, the `SearchResults` class is a stand alone class that has the single responsibilty of generating member objects. It is sepearte from the `member` model and the API service

Member model:
* Single Responsibilty: It is prefereable to call methods on an object instead of just creating hashes of members. By having a member object to work with, it allows it to stand alone
* Abstraction?: Yes, A lot of data went into creating the `member` object, but we just see it as a single object.
* Encapsulation?: Yes, all the data related to a member is held within a single object. It feels like the data has been put in a single capsule

Probublica Service:
* Single Responsiblity: It's sole resposibility is to access the API and return data in a more human usable format. Within the service there are two methods that each have a single responsibility. `conn` is used to access the general portion of the API, while `members_of_house(state)`'s responsibility is to use the general `conn` and then get a more specific result. We could add a third method similar to `members_of_house(state)` called `members_of_senate(state)`
* Abstraction?: Yes, at no point do we see the binary that is coming in, instead we get a nice usable ruby hash at the end.
* Encapsulation?: Yes, this class is only concerend with converting the API data. It is not concered with creating `member` objects, or sending data to the view. The service is put in this capsule that the rest of the project doesn't need to access