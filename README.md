# stuff

This project was practice setting up Zeitwerk with Dry-System and Roda for the purpose of code reloading during development.

I arrived at this point for as an exploration on creating my own framework using Roda. I want to be able to share this with other people, and the only way that I will be able to do that is if I can offer what other frameworks in our community offer. In this project, that is specifically the feature of code reloading.

The path getting here was a bumpy one, and there are a lot of things to still work out. [There is a tale to be told](##story-time)

The directory structure is not the traditional "MVC" or bucket system. It is based on allocating resources and the locality of behavior. It looks like such:

```ruby
project
│   README.md
│   app.rb
|   config.ru
│
└───allocs
│   │
│   └─── users
│       │   data_model.rb
│       │   routes.rb
│       │   name_decorator.rb
│   │
│   └─── posts
│       │   data_model.rb
│       │   routes.rb
│       │   publisher.rb
|
└───system
```
# rephlex-generated-poc
