# MyPix

MyPix is a Ruby on Rails app to store your pictures online.

Try it here: [mypx.herokuapp.com](http://mypx.herokuapp.com) (hosted on heroku free dyno, so please be patient the app may be sleeping).

The repository is accessible on [github.com/yannis/mypix](http://github.com/yannis/mypix)

MyPix has been built and tested with Ruby 2.2.0 and Rails 4.2.2.

It uses the following gems:

- [Figaro](https://github.com/laserlemon/figaro) for environment variables management
- [Devise](https://github.com/plataformatec/devise) for authentication
- [Cancancan](https://github.com/CanCanCommunity/cancancan) for authorization
- [Carrierwave](https://github.com/carrierwaveuploader/carrierwave) for file upload
- [Airbrake](https://airbrake.io) for exception notification
- [Rspec](http://rspec.info/) for testing

In MyPix you can:
  - sign up, sign in and sign out
  - reset your forgottent password
  - change your name and/or password
  - delete your account
  - upload pictures with title and description
  - edit a picture title, description and/or image
  - delete a picture

MyPix:
  - uses Postgresql as a database.
  - recovers the exif data of your pictures and stores them in a hstore postgres column.
  - is well optimized for mobile browsing (thanks to [Bootstrap](http://getbootstrap.com/)) and should be able to upload your pictures directly from your mobile device (tested on iOS 7 and 8 only).
  - stores its assets and the user pictures (Pix!) on amazon S3.
  - is supported by tests and the coverage is available [here](https://github.com/yannis/mypix/tree/master/coverage), thanks to [SimpleCov](https://github.com/colszowka/simplecov).

If you plan to clone it and run it, don't forget to set your environment variables in config/application.yml.

Send any questions to [yannis](mailto:yannisjaquet@mac.com).
