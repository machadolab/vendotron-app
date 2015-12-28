class Offer
  include Mongoid::Document
  include Mongoid::Timestamps

  has_one :item

end
