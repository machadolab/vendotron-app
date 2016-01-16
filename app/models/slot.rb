class Offer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :column, type: String # A
  field :row, type: Integer   # 3
  field :empty, type: Boolean, default: true

  has_one :item

end
