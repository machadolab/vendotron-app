class Purchase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String
  field :stripe_purchase_id, type: String
  field :purchase_price, type: Float

  belongs_to :item
  belongs_to :slot
  belongs_to :customer

end
