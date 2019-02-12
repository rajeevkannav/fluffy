class Todo
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :status, [:initialized, :started, :finished]

  ### Collection's field(s)
  field :title, type: String

  ### Validations
  validates_presence_of :title, :status
end
