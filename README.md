### From zero to Rails
1. install homebrew:
`ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
2. `brew install rbenv`
3. `brew install ruby-build`
4. `echo 'eval "$(rbenv init -)"' >> ~/.bash_profile`
5. `rbenv install -v 2.2.1`
6. `rbenv local 2.2.1`
7. `sudo gem install bundler`
8. `rbenv rehash`
9. `brew install mongodb`
10. `gem install rails --no-ri --no-doc` (Note: `ri` is a companion to `rdoc` allows you to 'display information about Ruby classes, modules, and methods' from your console. Removing the `rdoc` and `ri` when installing new gems speeds up your gem installations and creates less clutter in your system.)
11. `echo "gem: --no-ri --no-rdoc" > ~/.gemrc` (This is optional. If you want to default not having the documentation, add these flags to your global `gemrc` definition.)

### Set up Rails app running with MongoDB and Mongoid
1. `rails new project-rails --skip-active-record` (Note: Instead of using the default SQLite3, we will be running rails with MongoDB and Mongoid)
2. Add this line to your gemfile: `gem 'mongoid', '~> 4.0.0'`
3. `bundle`
4. `rails generate mongoid:config`

For more information, check out http://docs.mongodb.org/ecosystem/tutorial/ruby-mongoid-tutorial/

### Or just clone this repository!
1. install git
2. `git clone git@github.com:blanksblanks/project-rails.git`
3. `cd project-rails`
4. bundle
