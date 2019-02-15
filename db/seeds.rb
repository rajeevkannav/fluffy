# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'
obj_tags = []
10.times do
  obj_tags << {name: Faker::Lorem.word}
end

Tag.create(obj_tags)

obj_todos = []
1000.times do
  obj_todos << {
      title: Faker::Lorem.word,
      is_deleted: Faker::Boolean.boolean(0.2),
      status: Todo::ALLOWED_STATUSES.sample,
  }
end

Todo.create(obj_todos)

Todo.all.each do |todo|
  todo.tags = Tag.all.sample(5)
end
