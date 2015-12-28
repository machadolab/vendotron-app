class Purchase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String
  field :stripe_purchase_id, type: String

  belongs_to :item
  belongs_to :customer

end
