## 1. Rails app setup

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
10. Follow brew instructions to have launchd start mongodb at login:
    `ln -sfv /usr/local/opt/mongodb/\*.plist ~/Library/LaunchAgents`
Then to load mongodb now:
    `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mongodb.plist`
11. `gem install rails --no-ri --no-doc` (`ri` is a companion to `rdoc` allows you to 'display information about Ruby classes, modules, and methods' from your console. Removing the `rdoc` and `ri` when installing new gems speeds up your gem installations and creates less clutter in your system.)
12. `echo "gem: --no-ri --no-rdoc" > ~/.gemrc` (This is optional. If you want to default not having the documentation, add these flags to your global `gemrc` definition.)

### Set up a Rails app with MongoDB and Mongoid
1. `rails new appname --skip-active-record` (Instead of using the default SQLite3, we will be running rails with MongoDB and Mongoid. Also, replace `project-rails` with whatever you want to name your app)
2. Add this line to your gemfile in your app directory: `gem 'mongoid', '~> 5.0.0'`
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

## Some Meetups I plan to go to:
- [Game Night @ Kickstarter](http://www.meetup.com/Brooklyn-Swift-Developers/events/225289456/)
- [iOS Security for App Developers](http://www.meetup.com/NYSwift/events/224586428/)
- [Demystifying Apple Pay & Gilt + Swift](http://www.meetup.com/iOSoho/events/221974097/)

## 2. Schema Description

Example of generating a model: `rails g scaffold User first_name:String last_name:String email:String`

```
class User
  has_and_belongs_to_many :pets, inverse_of: :pets
  embeds_many :photos, as: :photographic
end

class Pet
  has_and_belongs_to_many :users, inverse_of: :users
  embeds_many :photos, as: :photographic
end

class Photo
  embedded_in :photographic, polymorphic: true
end
```


I chose the `has_and_belongs_to_many` association between users and pets because users can have multiple pets, and likewise, pets can have more than 1 owner. It's a common case where pets can have two pet parents if they are living with a couple.

I decided to allow photos to have a polymorphic association, meaning that a photo is a child embedded document that can belong to more than one type of parent document (in this case, a photo can belong to either a Pet or a User). Mongoid documentation states: "On the child object, an additional field will be stored that indicates the type of parent. Polymorphic behavior is allowed on all relations with the exception of has_and_belongs_to_many." To find out the parent of a photo with a polymorphic association, you can call `photo.photographic`.

## 3. Create Documents with Associations in `rails c`

There are two ways to create an association between two objects.

First, you can create them separately.

```
# Since user already exists
irb(main):001:0> rob = User.find_by(first_name: "Robert")
=> #<User _id: 5605773bf0ca50d9dc000000, first_name: "Robert", last_name: "L", email: "mystery@mystery.com", pet_ids: [BSON::ObjectId('5605778ef0ca50da39000001'), BSON::ObjectId('560577b5f0ca50da39000002')]>
irb(main):015:0> spicy = Pet.create(:name => "Spicy", :species => "Leopard Gecko", :color => "Pinkish", :birthday => "2011-11-11")
=> #<Pet _id: 56057d03f0ca50db48000000, name: "Spicy", species: "Leopard Gecko", color: "Pinkish", birthday: 2011-11-11 00:00:00 UTC, user_ids: nil>
irb(main):017:0> rob.pets << spicy
```

Or, you can use the build command. According to mongoid documentation: "If the document is embedded, in order to be persisted it must always have a reference to its parent document." Therefore, you have to use this approach when creating embedded documents.

```
irb(main):025:0>  photo1 = happy.photos.build(:label => "Happy's first snow", :description => "This is the first time Happy saw snow! He loved it!", :date_taken => "2014-11-01")
=> #<Photo _id: 56057f9df0ca50db48000003, label: "Happy's first snow", description: "This is the first time Happy saw snow! He loved it!", date_taken: "2014-11-01", pet_ids: nil>
irb(main):026:0> happy.photos
=> [#<Photo _id: 56057f9df0ca50db48000003, label: "Happy's first snow", description: "This is the first time Happy saw snow! He loved it!", date_taken: "2014-11-01", pet_ids: nil>]
# Call photographic on photo1 to find out where it is embedded in
irb(main):052:0> photo1.photographic
=> #<Pet _id: 5605778ef0ca50da39000001, name: "Happy", species: "Shiba Inu", color: "Black and Tan", birthday: 2014-07-29 00:00:00 UTC, user_ids: [BSON::ObjectId('5605775ef0ca50da39000000'), BSON::ObjectId('5605773bf0ca50d9dc000000')]>
```

## 4. Run a rake task

* To see all possible rake tasks: `rake -T`
* To run my rake task, which populates the database with the most popular baby names by sex and mother's ethnicity in New York City from app/assets/csvs/names.csv ([original link](https://data.cityofnewyork.us/Health/Most-Popular-Baby-Names-by-Sex-and-Mother-s-Ethnic/25th-nujf)): `rake dataset:populate_names`
* Run `rails c` and check that the command `Name.all.count` returns 5889 Name objects.


###Ruby on Rails, Fall 2015
This above line is added by me (Ahmad Maruf) for the purpose of pull request, as part of our Rails final project MUST Feature.
