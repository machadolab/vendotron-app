class Purchase
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String
  field :stripe_purchase_id, type: String
  field :purchase_price, type: Float

  #
  # validates_numericality_of :purchase_price,
  #                           :greater_than_or_equal_to => 20, :less_than_or_equal_to => 50,
  #                           :message => "lame"

  belongs_to :item
  belongs_to :slot
  belongs_to :customer

  def charge(token)

    begin
      self.purchase_price = self.item.price

      stripe_customer_id = self.customer.get_or_create_stripe_customer_id(token)

      stripe_amount = (self.purchase_price * 100).round
      stripe_charge = Stripe::Charge.create(
          :description => "Vendotron Purchase of #{self.item.name}",
          :amount => stripe_amount,
          :currency => "usd",
          :customer => stripe_customer_id
      )

      self.stripe_purchase_id = stripe_charge.id
      self.status = stripe_charge.status
      self.save

      stripe_charge.captured
    rescue => e
      Rails.logger.warn "Stripe error: #{e.message}"
      false
    end
  end

end
