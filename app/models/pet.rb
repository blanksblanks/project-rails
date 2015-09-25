class Pet
  include Mongoid::Document
  field :name, type: String
  field :species, type: String
  field :color, type: String
  field :birthday, type: Date

  has_and_belongs_to_many :users, inverse_of: :users
  embeds_many :photos, as: :photographic

end
