class Photo
  include Mongoid::Document
  field :label, type: String
  field :description, type: String
  field :date_taken, type: Date

  embedded_in :photographic, polymorphic: true
  has_and_belongs_to_many :pets

end
