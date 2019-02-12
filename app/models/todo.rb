class Todo
  include Mongoid::Document
  field :title, type: String
  field :status, type: Integer
end
