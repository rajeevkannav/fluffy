object @todo
attributes :_id, :title, :status
child :tags, :object_root => false do
  attributes :name
end