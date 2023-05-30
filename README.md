# Movie Review App

The Movie Review App is a Ruby on Rails web application that allows users to browse and review movies. Users can register, log in, and search for movies in the app's extensive movie database. They can also leave reviews, rate movies, and get the opinion of other users.

This README file provides an overview of the Movie Review App, including its features, installation instructions, and usage guidelines.


## Features:
The Movie Review App comes with the following features:
    User Registration: Users can create an account by providing their email address and password. They can also log in using their credentials.
    Movie Search: Users can search for movies by title or rating. The app utilizes a movie database to provide accurate and relevant search results.
    Movie Details: Users can view detailed information about each movie, including its title, movie length, director, rating and a brief description.
    Reviews and Ratings: Users can leave reviews for movies and rate them on a scale of 1 to 5 stars.


## Prerequisites:
- ruby 2.6.3
- PostgreSQL 10.23
- Rails 5.0.7.2


## Installing:
1) Clone repository:
   ```git clone https://github.com/elizapaskko/MovieReview```

2) Build project:

To build the application execute the following commands in CLI in the project folder(.../backend):
- ``` rails db:create ```  # this will create your database
- ``` rails db:schema:load ```  # this will create columns in your database
- ``` bundle install ```  # this will install required libraries


### Running the Application:
Now you can launch the server for example (default port is 3000) [http://localhost:3000](http://localhost:3000):
- ```rails s```


## Usage
Once the Movie Review App is running, you can begin using its features:
    Create an account by clicking on the "Sign Up" link and providing your email address and password. Alternatively, you can log in if you already have an account.
    Use the search bar to find movies by title or rating. Click on a movie from the search results to view its details.
    On the movie details page, you can read reviews left by other users, rate the movie, and leave your own review.
    Log out of the app when you're done by clicking on the "Log Out" link in the navigation menu.

## Routes
### Маршрути для юзері:
- GET '/users/sign_in': отримати форму для логіну
- GET '/users/sign_up':
- POST '/users/sign_in': відправити запит на логін
- DELETE /users/sign_out: вийти з облікового запису

### Built With:
- Rails - Web framework


## Our team
* [Pasko Yelyzaveya (Dev)](https://github.com/elizapaskko)
* [Sofiia Seredova (Dev)](https://github.com/sseredova)


## License
__©️ Karazin university__

Thank you for using the Movie Review App! We hope you enjoy exploring and reviewing movies with our application.
