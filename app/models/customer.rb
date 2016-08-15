class Customer
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :email, type: String
  field :stripe_customer_id, type: String

  has_many :purchases

  # activeadmin mongoid fix
  self.primary_key = :_id


  def get_or_create_stripe_customer_id(token)

    unless stripe_customer_id
      stripe_customer = Stripe::Customer.create(
          :email => self.email,
          :source => token
      )
      self.stripe_customer_id = stripe_customer.id
      self.save
    end

    self.stripe_customer_id
  end

end
