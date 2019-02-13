# fluffy (TODO application
> a TODO application backend with Rails 4 and mongodb, only provide RESTful API

- [Prerequisite](#prerequisite)
- [Installation](#installation)
- [Features](#features)
- [Test](#test)
- [Issues](#issues)


##prerequisite

### Ubuntu 16.04.5 LTS
### ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-linux]
### rails 4.2.7.1
### MongoDB

##installation

```
git clone git@github.com:rajeevkannav/fluffy.git
cd fluffy
gem install bundler
bundle install
rake db:create db:seed
rails s
```

##features

#### Create todo item
#### (TBD) Mark todo item status as start, finish or not start
#### Delete todo item, undo deleted todo item
#### (TBD) Tags can be attached to todo item
#### (TBD) Find all todo items by tag
#### Modify todo item
#### Pagination of todo item list

##test

To run tests: 
```
bundle exec rspec
```
##issues
#### FIXME
A Broken Access Control vulnerability in Active Job versions >= 4.2.0 allows an attacker to craft user input which can
cause Active Job to deserialize it using GlobalId and give them access to information that they should not have.

