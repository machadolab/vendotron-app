ActiveAdmin.register Purchase do
  permit_params :status, :customer_id, :item_id, :slot_id, :purchase_price, :stripe_purchase_id

  index do
    column :status
    column :customer
    column :item
    column :created_at
    actions
  end

  filter :status
  filter :customer
  filter :item
  filter :created_at

  form do |f|
    f.inputs "Purchase Details" do
      f.input :customer
      f.input :item
      f.input :slot
      f.input :status
      f.input :purchase_price
      f.input :stripe_purchase_id
    end
    f.actions
  end

end
