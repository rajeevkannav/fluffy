# fluffy (TODO application
> a TODO application backend with Rails 4 and mongodb, only provide RESTful API

- [Prerequisite](#prerequisite)
- [Installation](#installation)
- [Features](#features)
- [Test](#test)
- [Issues](#issues)


## prerequisite

 - Ubuntu 16.04.5 LTS
 - ruby 2.2.2p95 (2015-04-13 revision 50295) [x86_64-linux]
 - rails 4.2.7.1
 - MongoDB

## installation

```
git clone git@github.com:rajeevkannav/fluffy.git
cd fluffy
gem install bundler
bundle install
rake db:create db:seed
rails s
```

## features

 - Create todo item
 
    ```
    curl -X POST \
      http://localhost:3000/api/todos \
      -H 'Content-Type: application/json' \
      -H 'cache-control: no-cache' \
      -d '{
        "todo": 
        {
            "title": "<Todo Title>"
        }
    }'
    ```
 - Get a todo item
    ```
    curl -X GET \
      http://localhost:3000/api/todos/:todo_id \
      -H 'cache-control: no-cache'
    ```   
 - Mark todo item status as start, finish or not start
 
    ```
    curl -X PATCH \
      http://localhost:3000/api//todos/:todo_id/update_status \
      -H 'Content-Type: application/json' \
      -H 'cache-control: no-cache' \
      -d '{
        "todo": {
            "status": "<started|finished>"
        }
    }'        
    ```
 - Delete todo item, undo deleted todo item
    
    ```
    curl -X DELETE \
     http://localhost:3000/api/todos/:todo_id \
     -H 'cache-control: no-cache'
    ``` 

    ```
    curl -X PATCH \
      http://localhost:3000/api/todos/:todo_id(deleted)/restore \
      -H 'cache-control: no-cache'
      ``` 
   
 
 - Tags can be attached to todo item

     ```
        curl -X PUT \
          http://localhost:3000/api/todos/:todo_id/assign_tags \
          -H 'Content-Type: application/json' \
          -H 'cache-control: no-cache' \
          -d '{
            "tag": {
                "name": "<TagName>"
            }
        }'
    ``` 
 - Find all todo items by tag
 
     ```
        curl -X GET \
          http://localhost:3000/api/tags/:tag_name/todos \
          -H 'Content-Type: application/json' \
          -H 'cache-control: no-cache'    
    ```
    
 - Modify todo item
 
     ```
    curl -X PATCH \
      http://localhost:3000/api/todos/:todo_id \
      -H 'Content-Type: application/json' \
      -H 'Postman-Token: fec854da-379e-455d-90be-e6e69df9a465' \
      -H 'cache-control: no-cache' \
      -d '{
        "todo": {
            "title": "title updated"
        }
    }'
        ```
    
 - Pagination of todo item list
 
    ```
     curl -X GET \
       'http://localhost:3000/api/todos?page=2' \
       -H 'cache-control: no-cache'
    ```

    To validate further Postman's exported collection is also available into root directory.
    (fluffy (Todo Application).postman_collection.json).
## test

To run tests: 

    ```
    bundle exec rspec
    ```

##issues

 - A Broken Access Control vulnerability in Active Job versions >= 4.2.0 allows an attacker to craft user input which can
cause Active Job to deserialize it using GlobalId and give them access to information that they should not have.

