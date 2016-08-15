ActiveAdmin.register Item do
  permit_params :name, :description, :picture_url, :price, :more_info_url

  index do
    column :name
    column :price
    column :created_at
    actions
  end

  filter :name
  filter :description
  filter :price
  filter :created_at

  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :description, as: :html_editor
      f.input :picture_url
      f.input :price
      f.input :more_info_url
    end
    f.actions
  end

end
