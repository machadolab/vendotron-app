class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :picture_url, type: String
  field :price, type: Float

  has_many :offers

end
