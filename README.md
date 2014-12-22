# Mr. Skellington Starter Kit

This template provides a basic a Rails app with the following gems:
* 'rspec-rails'
* 'capybara'
* 'pry-rails'
* 'launchy'
* 'factory_girl_rails'
* 'foundation-rails''

## Getting Started

```no-highlight
# Clone down this template
git clone https://github.com/lizvdk/mr-skellington.git <YOUR_APP_NAME>

# Move into your app's directory
cd <YOUR_APP_NAME>

# Install all the gems
bundle install

# Remove the old git history and start your own
rm -rf .git && git init && git add -A && git commit -m 'Initial commit'

# Remove this README and create your own.
rm README.md && touch README.md
```

### Configuring Your Database

This template is set up for using a PostgreSQL database.
Edit `config/database.yml` to use your app name.


#### Next, create your database:
```
$ rake db:create
$ rake db:migrate
```

---
Build cool shit!
