== README

It's simple TodoList application created with Rails 4

- Tests are written with RSpec/Capybara/FactoryGirl 

- Own tests in spec/features and /spec/models directories

- spec/support/utilites.rb contains all functions used in tests

before starts run ``` bundle install ```

To prepare database use follow commands:

For migrations 

``` rake db:migrate ```

Fill database with sample data 

``` rake db:populate ```


Live demo http://todolist-rails.herokuapp.com
