class Tag

  ### Module(s) inclusion
  include Mongoid::Document

  ### Collection's field(s)
  field :name, type: String

  ### Validations
  validates :name, uniqueness: true, presence: true

  ### Associations
  has_and_belongs_to_many :todos

end
