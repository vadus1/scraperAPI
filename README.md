README
------

This is a tiny RESTful API to index a page's content. "Index the content" means
to parse the page content and store its content - in this case to store the
content that is found inside the tags h1, h2 and h3 and the links .

The API have two endpoints:

1. The former receives a url, indexes the content and stores it in the database.
   Content includes only header tags (H1, H2 and H3) and links urls.

  POST /pages pages#create

2. The other endpoint lists previously stored urls

  GET /pages pages#index


Dependencies
------------

Before setup the application, you need to install:

- The Ruby language (version 2.2)
- Rails (versions 4.2)
- PostgreSQL

Check that appropriate versions of Ruby and Rails are installed in your development environment:
`$ ruby -v`
`$ rails -v`

Configuration
-------------

clone this response

`git clone ....`

Switch to the application directory to examine and test what you’ve built.

`$ cd crawler`

Run `bundle install`


Database creation
-----------------

```
# Create the Postgres user
createuser crawler

# Create the databases
createdb -Ocrawler -Eutf8 crawler_test
createdb -Ocrawler -Eutf8 crawler_development

#Enable the database to persist hashes and use of uuid
psql -U crawler crawler_development
CREATE EXTENSION IF NOT EXISTS hstore;
CREATE EXTENSION IF NOT EXISTS uuid-ossp;

# test it
rawler_development=# SELECT 'company => arkency, blogpost => hstore'::hstore;
                   hstore
--------------------------------------------
 "company"=>"arkency", "blogpost"=>"hstore"
(1 row)

crawler_development=# SELECT uuid_generate_v4();
           uuid_generate_v4
--------------------------------------
 e179c330-928c-48af-8ba5-1e2a65e70019
(1 row)

# Playing with json
crawler_development=# CREATE EXTENSION IF NOT EXISTS json;
CREATE TABLE books ( id integer, data json );
crawler_development=# INSERT INTO books VALUES (1,
  '{ "name": "Book the First", "author": { "first_name": "Bob", "last_name": "White" } }');

```
References:

- [Setting Up PostgreSQL on Mac OSX](http://www.tunnelsup.com/setting-up-postgres-on-mac-osx)
- [How To Setup Ruby on Rails with Postgres](https://www.digitalocean.com/.../tutorials/how-to-setup-ruby-on-rails-with-postgres)


Database initialization
-----------------------

```
# Run migrations
rake db:migrate
```

Start the Web Server
--------------------

Run the app by entering the command:
```
$ rails server
```

To see your application in action, please refer to API Documentation and browse the generated docs

API Documentation
-----------------

Generate the docs!

```
$ rake docs:generate
```

Browse docs

```
http://localhost:3000/v1/api/docs
```


How to run the test suite
-------------------------
The application contain a suite of RSpec tests.
Run `rspec -fd` to run all RSpec tests.

Please send the author a message, create an issue, or submit a pull request if you want to contribute improved RSpec tests.

Deployment instructions
-----------------------

For easy deployment, use a “platform as a service” provider such as:

- [Heroku](http://www.heroku.com/)
- [CloudFoundry](http://www.cloudfoundry.com/)
- [EngineYard](http://www.engineyard.com/)
- [OpenShift](https://openshift.redhat.com/app/)

For deployment on Heroku, see the article:

- [Rails on Heroku](http://railsapps.github.io/rails-heroku-tutorial.html)
