# README

* Ruby version `2.7.2`

* How to run app
1. Install Prerequisites
  - Rmagick:

    For ubuntu: https://github.com/rmagick/rmagick#ubuntu
   
    For MacOs: https://github.com/rmagick/rmagick#macos

2. Bundle
  ```
    bundle install --path vendor/bundle
  ```

3. Setup DB and seed data
  ```
    bundle exec rails db:drop db:create db:migrate db:seed
  ```

4. Run server
  ```ruby
    ### Rails server
    bundle exec rails s

    ### Sidekiq server
    bundle exec sidekiq default mailers

    ### Mailcatcher server
    bundle exec mailcatcher
  ```

  Go to app at http://localhost:3000
  
  Login by email with format: test_#{i}@example.com with i is number from 0 to 9

  Note: To check email please go to http://127.0.0.1:1080/
