# Kind Kitchen - Project README
# Front-End

Link to [Kind Kitchen Website](https://consultancy-fe-b49461b80f89.herokuapp.com) <br/>
Link to [Back-End Microservice](https://github.com/WillWeston94/consultancy-be)

## Setup
- Ruby 3.2.2
- Rails 7.0.7.2
- [Faraday](https://github.com/lostisland/faraday) gem to interact with APIs
- [SimpleCov](https://github.com/simplecov-ruby/simplecov) gem for code coverage tracking
- [ShouldaMatchers](https://github.com/thoughtbot/shoulda-matchers) gem for testing assertions
- [VCR](https://github.com/vcr/vcr) / [Webmock](https://github.com/bblimke/webmock) to stub HTTP requests in tests to simulate API interactions
- [Omniauth](https://github.com/omniauth/omniauth) gem for Oauth

## Installation Instructions
 - Fork Repository
 - `git clone <repo_name>`
 - `cd <repo_name>`
 - `bundle install`   
 - `rails db:{drop,create,migrate,seed}`
 - `rails server`
 - In your web browser, navigate to your local host `http://localhost:5000`

## Project Description
**KindKitchen ** is a dedicated platform for those seeking wellness-focused, dietary-sensitive recipes and meal planning. Kind Kitchen caters to individuals with specific dietary needs, offering curated recipes, for a balanced lifestyle. Whether you're following a FODMAP diet, vegan, gluten-free, or just looking to eat healthier, Kind Kitchen has something for everyone. It is a full-stack project that leverages the [Spoonacular API](https://spoonacular.com/food-api). This repository contains the front-end portion of the project which utilizes the [API](https://github.com/WillWeston94/consultancy-be) provided by the back-end repository.

This project has been deployed using [Heroku](https://id.heroku.com/login), and [Circle CI](https://circleci.com/) was used for Continuous Integration.

## Features
The Spoonacular Natural Language search endpoint allows for a great deal of flexibility in search terms. Users can search for general meal catagories, cuisine type, specific ingredients, or just type out what they are hungry for! The advanced search option offers a range of specific diatary plans and restrictions that will filter the search results even further.

Users can register for free either by entering their email or by using OAuth. Once registered, users can save favorite recipes to their personal dashboard for easy access.


## Contributors

- [Paul Bennett](https://www.linkedin.com/in/paul-bennett-dev/) -GitHub: [@pcbennett108](https://github.com/pcbennett108)
- [Tyler Blackmon](https://www.linkedin.com/in/tyler-blackmon/) - GitHub: [@tblackmon-tiel](https://github.com/tblackmon-tiel)
- [Nicholas McEnroe](https://www.linkedin.com/in/nicholasmcenroe/) - GitHub: [@NSMcEnroe](https://github.com/NSMcEnroe)
- [Will Weston](https://www.linkedin.com/in/weston-william/) - GitHub: [@z-fitch](https://github.com/WillWeston94)


### Web View
![kindkit-main-scr](https://github.com/WillWeston94/consultancy-fe/assets/88985382/aa85a9da-d9be-4091-8aae-06576676fd00)
![kindkit-adv-scr](https://github.com/WillWeston94/consultancy-fe/assets/88985382/b6ef251a-a87d-47d1-b0f5-420479d842f6)
![kindkit-dash-scr](https://github.com/WillWeston94/consultancy-fe/assets/88985382/17fc09e2-5e92-4b49-bc5f-95d05ed3fb15)

