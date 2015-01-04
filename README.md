<h1>Skill Trade</h1>

A website that will allow people to barter for skills based on a one-to-one trade.

<h3>ER Diagram</h3>
![Alt text](/app/assets/images/1.png?raw=true "Optional Title")

<h3>User Stories</h3>

<h5>Home Page</h5>
```
As someone who knows japanese(example skill)
I want to find out how many other users both want to learn japanese(example skill)
and already know ruby(example skill)
So that I can decide whether I want to sign up for an account and barter for skills.
```

Acceptance Criteria:
- [ ] Only goto this page as the root if user is not signed in
- [ ] User inputs a skill they want to learn from a drop down menu of skills
- [ ] User inputs a skill that they already know and are willing to teach from a drop down menu of skills
- [ ] User clicks a button("Find People") to signify that they are done
- [ ] Expect the page to tell the user how many people match the specified criteria
- [ ] Expect page to ask the user user to sign up with those attribues
- [ ] If they are the first user that matches the combination expect a diffrent prompt
than if users exist in the database that match the current users criteria.
- [ ] Expect the new form on the next page to already have inputed skills filled out in appropriate places
- [ ] If the skills are not in the database expect the page to propmt the user to sign up for an account
and add the skill

<h5>Home Page part 2</h5>
```
As a curious user
I want to see a news feed with the most recent skill trades that took place on the home page
```

Acceptance Criteria:


<h5>Sign Up</h5>
```
As someone who wants to trade skills
I want to sign up for the skill trade app
so that I can use all of its awesome features.
```

Acceptance Criteria:
- [ ] There is a link to sign up on the homepage (will be in header if you want to bypass the select boxes)
- [ ] If I fill in my first name, last name, email, password, city and state correctly I am able to sign up for an account.
- [ ] I am able to optionally fill out a skill that i want to learn and a skill that i already know.
- [ ] If the password and password confirmation don't match I am not able to sign up for an account.



<h5>Fill Out Profile</h5>
```
As someone who wants to trade skills
I want to fill out a profile
so that other users can see what I know my level of expertise and what I want to learn.
```
Note: I want this to look more like you are editing an existing profile rather than just filling out a form.
Acceptance Criteria:
- [ ] Once you are signed in there is a link to fill out and view your profile on the homepage
- [ ] When you click on the link expect to see the current users user name
- [ ] Expect to see profile fields including, "Skills I know",  "Skills I want to Learn", "Reviews(not editable by user),
- [ ] Expect to see field "describe your expertise" beneath each already entered skill
- [ ] Expect to see one skill


<h5>Add a review to a users page</h5>
