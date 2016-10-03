# Erin's Reflection 

This was by far my least favorite project so far, and I was confused most of the time. It was so difficult to know what was default Rails automagic and how to go in to change those attributes. Troubleshooting was really tricky because sometimes the issue was with something Rails automatically did - like buttons automatically going to push methods. For example, figuring out how to target different sections of a form written in erb rather than html for formatting was frustrating. I have a little hacky solution where I stuck in empty p tags so there would be space between the different form sections, but I don't know how to achieve this in a more conventional way. I'm still not sure how to style buttons. I'm not sure how to make my "complete", "edit" and "delete" buttons line up inline with the task. I have logic in my view for whether to show the empty box or the check mark and I'm pretty sure it shouldn't be there because we're not supposed to have logic there. 

My chair pair helped me separate my update method into two methods wherein I updated the completion status separately. This was a better way than I had originally because the completion status needed to go to current page with the updates, but when editing the update needed to appear on a different page. My chair pair also used radio buttons for the completion status, which I don't know how to do. 



# Task List Rails ✅
We are going to build a Task List in Rails. This web application will enable us to keep track of list of tasks with the functionality to add, edit and remove tasks from a list.

Tracking tasks in a web app will let us focus on following Rails conventions and learning how data flows through a Rails application.

## Baseline
**Once you've achieved this baseline, take a walk around the room and see if you can answer questions or help other folks.**

This project...

- Will have our standard Github setup (fork this repo and clone to your machine)
- requires you to create a Rails application
  - create a controller for your `Tasks`
  - conform to Rails conventions on naming and inflection

Baseline Part 2:
- create a `Task` model and migration.
  - create the database schema and tables with `rake db:migrate`
  - the `Task` model should include _at least_ a name, a description and a completion indicator

Tinker with your Model in the `rails console` in order to ensure you have created your model and can interact with it as expected.

## Task Data Requirements

Each task record will include all of the following. Optional in this context means that the user may choose not to provide this information, but it is still required for your schema:
- Self-incrementing identifier (ID)
- title: the title of the task
- description: details about the task
- completed_at: the time and date the task was completed

## 🌊 Wave 1
This wave is where we will introduce the view layer to interact with our application via the browser.

- Set up necessary controller(s) and route(s) that you will need in order to show a task from the database
- Create a root route for your application that directs users to the list of all tasks
  - Each task name in the list should link to a `show` action that will render a new view for the user.
  - The `show` view should include the complete information about the task: name, description, completion status, and completion date.
- All markup in all views should have semantic relevance.


## 🌊 Wave 2
In this wave we will add the first set of user interactivity and persistence.

- Be able to create a new task:
  - The home page should contain a link to Add a new task. This will give the user a form to fill out with the appropriate task fields.
  - After the new task is added, the site should take the user back to the home page which displays the full list of tasks. The new task that was just added should be included in the full list of tasks.
- Be able to delete an existing task:
  - Add a route and controller action whose responsibility is deleting a task (RESTful routes)
  - On the home page, add a button or link for each task that will, once clicked...
    1. Ask the user to confirm that they definitely want to delete the task.
    1. Delete the task from the database and redirect the user back to the list of remaining tasks

<!-- ## 🌊 Wave 3
In this wave we will extend the interactivity with users, allowing them to edit existing tasks in a couple of different ways. As always, follow _RESTful_ conventions when implementing these features.

- Add the ability for the user to mark a task complete
  - Add a button to the list of tasks on the home page that, when clicked, will mark a task complete.
  - Update the database with the task's completed date
- Add the ability for the user to edit a task's details.
  - Add an `edit` action that renders a form allowing the user to update all the fields of a task.
  - Submitting the form from the `edit` action should _update_ the existing task; not create a new one.
    - Research: ActiveRecord's `update` method.
  - Link to the `edit` action from the task's `show` page.
  - DRY up your code by reusing the view code from the `new` functionality
    - Hint: Rendering _partials_ in Rails.

 -->
