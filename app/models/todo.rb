class Todo

  ### Module(s) inclusion
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Enum

  ### Constant(s)
  ALLOWED_STATUSES = [:initialized, :started, :finished]

  enum :status, ALLOWED_STATUSES

  ### Collection's field(s)
  field :title, type: String
  field :is_deleted, type: Mongoid::Boolean, default: false

  ### Validations
  validates_presence_of :title, :status, :is_deleted

  ### declaring scope assuming deleted todos to be kept hidden by default
  default_scope -> {where(is_deleted: false)}

  ### Associations
  has_and_belongs_to_many :tags
end
