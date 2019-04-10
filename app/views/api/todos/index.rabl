object false
collection @todos, :object_root => false
attributes :_id, :title, :status, :is_deleted
child :tags, :object_root => false do
  attributes :name
end
