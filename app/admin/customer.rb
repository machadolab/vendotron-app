ActiveAdmin.register Customer do
  permit_params :name, :email

  index do
    column :name
    column :email
    column :created_at
    actions
  end

  filter :name
  filter :email
  filter :created_at

  form do |f|
    f.inputs "Customer Details" do
      f.input :name
      f.input :email
    end
    f.actions
  end

end
