class Item
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :picture_url, type: String
  field :price, type: Float
  field :more_info_url, type: String

end
