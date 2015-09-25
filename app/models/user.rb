class User
  include Mongoid::Document
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String

  has_and_belongs_to_many :pets, inverse_of: :pets
  embeds_many :photos, as: :photographic

end
