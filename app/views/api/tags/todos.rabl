object false
collection @todos
attributes :id, :title, :status
child :tags, :object_root => false do
  attributes :name
end
