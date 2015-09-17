### From zero to Rails
1. install homebrew:
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. `brew install rbenv`
3. `brew install ruby-build`
4. `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile` (or whatever shell you use)
5. `rbenv install -v 2.2.1`
6. `rbenv local 2.2.1`
7. `sudo gem install bundler`
8. `rbenv rehash`
9. `brew install mongodb`
10. `gem install rails --no-ri --no-doc` (`ri` is a companion to `rdoc` allows you to 'display information about Ruby classes, modules, and methods' from your console. Removing the `rdoc` and `ri` when installing new gems speeds up your gem installations and creates less clutter in your system.)
11. `echo "gem: --no-ri --no-rdoc" > ~/.gemrc` (This is optional. If you want to default not having the documentation, add these flags to your global `gemrc` definition.)

### Set up a Rails app with MongoDB and Mongoid
1. `rails new appname --skip-active-record` (Instead of using the default SQLite3, we will be running rails with MongoDB and Mongoid. Also, replace `project-rails` with whatever you want to name your app)
2. Add this line to your gemfile in your app directory: `gem 'mongoid', '~> 4.0.0'`
3. `bundle`
4. `rails generate mongoid:config` (This creates a mongoid.yml file in your config)
5. `rails s`
6. Go to localhost:3000 from your browser and you'll see: "Welcome aboard: You're riding Ruby on Rails!"
7. Follow the guidelines to start developing your application. Official guide:
  - http://guides.rubyonrails.org/getting_started.html
For more information on running rails with mongoid, check out:
  - http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/

### Or just clone this repository! (follow from zero to rails step if you don't already have rails installed)
1. install git
2. `git clone git@github.com:blanksblanks/project-rails.git`
3. `cd project-rails`
4. bundle

## Some meetups I plan to go to:
- [Game Night @ Kickstarter](http://www.meetup.com/Brooklyn-Swift-Developers/events/225289456/)
- [iOS Security for App Developers](http://www.meetup.com/NYSwift/events/224586428/)
- [Demystifying Apple Pay & Gilt + Swift](http://www.meetup.com/iOSoho/events/221974097/)
