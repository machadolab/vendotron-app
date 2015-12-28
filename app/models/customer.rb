class Customer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :stripe_customer_id, type: String

  has_many :purchases

end
