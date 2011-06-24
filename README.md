# OC Ruby Website #

# Components

* Mongoid
* Haml
* SCSS
* JQuery
* Riot
* RR
* Jasmine

# Setup and Installation #

### You need to have bundler and rvm installed.

  http://gembundler.com/

  https://rvm.beginrescueend.com/rvm/install/


### Grab all your dependencies by:

    $ bundle install

### Install gitflow
I suggest we try the gitflow (https://github.com/nvie/gitflow) branching
model for this repo.  Initialize it for your repo with the defaults.

# Testing #

Provided is a watchr script that will act as your 'autotest'. You can
run it by:

    $ watchr test.watchr

Some caveats:

It excepts you have growl and looks for images, at `~/.watchr_images` for
`passed.png` or `failed.png`.


If you want to run the tests manually you can do:

    $ bundle exec padrino rake test

to run the entire suite.

To see other possible tasks run:

    $ bundle exec padrino rake -T

# Features / Work Assignments #

Add your feature onto the issues for this project. If you want to own a
feature, assign yourself the ticket. For general milestones we can
discuss it or I can curate them into milestones I see appropriate for
each successive release.
