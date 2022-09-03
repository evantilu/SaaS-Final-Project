# Let's MEET!
## About

Let's MEET! is a scheduling web app that assist groups finding the best meeting time and location, providing many basic features and easily accessible user interface.
* Github: https://github.com/YunkaiZhu/saas_final_project

## Contributors
* Yunkai Zhu 
* Evan Ting-l Lu
* Cheng Zhang
* Daisy Wang

## Softwares
* Ruby - 2.6.8
* Rails - 6.1.4.1
* Cucumber - 7.1.0

## Instructions to run
### Running app locally
In order to run the local version of Let's MEET!, make sure bundler is installed. Navigate to the saas_final_project folder, and run the following command:
```bash
bundle install
```
Then we need to clear rails database and seed and rails server before moving on to next step. 
```bash
rails db:create
rails db:migrate
```
Using the command below to add all pacakges:
```bash
bundle exec rails webpacker:install 

```
Now we are ready to start the server, type the following command and 
navigate to http://localhost:3000 (local deployment) or go to https://saas-final-project.herokuapp.com for a deployed version on heroku.

```bash
bundle exec rails server
```

## Instructions to test
To run tests or view coverage, use either of the following commands:
```bash
rake cucumber
```
OR

```bash
rspec
```
rspec will generate a coverage report under coverage folder


