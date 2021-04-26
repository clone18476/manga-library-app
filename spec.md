# Specifications for the Sinatra Assessment

Specs:
- [] Use Sinatra to build the app --- Used Corneal to generate the project. Included Sinatra in the Gemfile. Was already required in the environment file.
- [] Use ActiveRecord for storing information in a database --- Also included during Corneal generation. ActiveRecord is installed in the Gemfile and inherited in the necessary files.
- [] Include more than one model class (e.g. User, Post, Category) --- Created two models: a User and a Comic.
- [] Include at least one has_many relationship on your User model (e.g. User has_many Posts) --- A User has many Mangas. 
- [] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) --- A Comic belongs to a User.
- [] Include user accounts with unique login attribute (username or email) --- Used validation to ensure that during sign-up, the user's e-mail is unique and present. You cannot create an account with an e-mail that is already in the database. 
- [] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --- ComicController has routes that allow user to add a new manga (get '/mangas/new' & post '/mangas'), read it (get '/mangas/:id'), edit it (get '/mangas/:id/edit' && patch '/mangas/:id'), and delete it (delete '/mangas/:id'). 
- [] Ensure that users can't modify content created by other users --- Used conditionals within the edit and delete routes. The code only executes if the current user's ID matches the mangas user ID. Using ERB tags, I also added an additional conditional within the manga show page. A user can only see the edit link and delete button for their own content, not for anything published by another user. This provides a failsafe.
- [] Include user input validations --- A Comic can only be submitted or edited if it has a title. Otherwise, the user is redirected back to the proper form. Prevents a completely empty database entry.
- [] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new) --- Used the flash gem and associated flash messages to inform user when they have entered inappropriate data into a form (login, sign-up, new manga or edit manga).
- [] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code --- Added ReadMe file with necessary information to use app.

Confirm
- [] You have a large number of small Git commits
- [] Your commit messages are meaningful
- [] You made the changes in a commit that relate to the commit message
- [] You don't include changes in a commit that aren't related to the commit message