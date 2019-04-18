object @todo
attributes :_id, :title, :status, :is_deleted
child :tags, :object_root => false do
  attributes :name
end