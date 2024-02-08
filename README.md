# README

This README would normally document whatever steps are necessary to get the
application up and running.

## Getting started:

To get started wit the app, clone the repo and then install the needed gems:

```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```


To reset database (delete database) and seed new/start fresh:
```
heroku pg:reset -a leia-bear-app
heroku run rails db:migrate -a leia-bear-app
heroku run rails db:seed -a leia-bear-app
```

