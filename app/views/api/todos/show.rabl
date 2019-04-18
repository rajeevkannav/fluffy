object false
object @todo
attributes :id, :title, :status, :is_deleted
child :tags, :object_root => false do
  attributes :name
end