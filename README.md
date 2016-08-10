# Tiny Stay: an AirBnB clone for Tiny Homes
[Hosted live on heroku here!](http://tinystay.herokuapp.com/)

![](https://s3-us-west-2.amazonaws.com/project-screenshots/tinystay.jpg)


## Description

A team project practicing brownfield development by pivoting an E-commerce tool rental website into a multi tenancy Airbnb clone. Users can list homes for rent, and make reservations on other homes through a JQuery date picker which only displays dates a home is available.

The project was built by pivoting the tool rental site [Tool Chest](https://github.com/kamiboers/toolchest)

## Clone down the project

```
git clone git@github.com:jwashke/the_pivot
```

cd into the project directory

```
cd the_pivot
```

bundle

```
bundle
```

## Run the app in development
To run the app, follow the instructions above for cloning down the app.

You'll need an AWS account with an S3 bucket.

Use the figaro gem to create an application.yml file.

```
bundle exec figaro install
```
Put these lines of code in that files
```
S3_BUCKET_NAME: put your bucket name here
AWS_ACCESS_KEY_ID: put your access key id here
AWS_SECRET_ACCESS_KEY: put your secret access key here
```

Setup the database

```
bundle exec rake db:create db:migrate db:seed
```

Start the server by running

```
rails s
```

and visit the site at [http://localhost:3000](http://localhost:3000)

## Run the tests

To run the tests, follow the instructions above for cloning down the app.

You'll need an AWS account with an S3 bucket.

Use the figaro gem to create an application.yml file.

```
bundle exec figaro install
```
Put these lines of code in that files
```
S3_BUCKET_NAME: put your bucket name here
AWS_ACCESS_KEY_ID: put your access key id here
AWS_SECRET_ACCESS_KEY: put your secret access key here
```

Setup the database

```
bundle exec rake db:create db:migrate db:seed
```

Run the tests by running

```
rspec
```

## Production

Visit the app on Heroku at [http://tinystay.herokuapp.com](http://tinystay.herokuapp.com/)

It may take about 30 seconds for the Heroku Dyno to spin up.

## Contributors

* [Joshua Washke](https://github.com/jwashke)
* [Ashwin Rao](https://github.com/theonlyrao)
* [Patrick Hardy](https://github.com/patrickwhardy)
