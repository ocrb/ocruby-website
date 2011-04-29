# OC Ruby Website #

# Components

Mongoid

Haml

SCSS

JQuery

Riot

RR


# Setup and Installation #

### You need to have bundler and rvm installed.

  http://gembundler.com/

  https://rvm.beginrescueend.com/rvm/install/


### Grab all your dependencies by:

    $ bundle install

# Testing #

Provided is a watchr script that will act as your 'autotest'. You can
run it by:

    $ watchr test.watchr

Some caveats:

It excepts you have growl and looks for images, at `~/.watchr_images` for
`passed.png` or `failed.png`.


If you want to run the tests manually you can do:

    $ padrino rake test

to run the entire suite.

To see other possible tasks run:

    $ padrino rake -T
