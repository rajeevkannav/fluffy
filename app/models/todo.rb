class Todo

  ### Module(s) inclusion
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  enum :status, [:initialized, :started, :finished]

  ### Collection's field(s)
  field :title, type: String
  field :is_deleted, type: Mongoid::Boolean, default: false

  ### Validations
  validates_presence_of :title, :status, :is_deleted

end
