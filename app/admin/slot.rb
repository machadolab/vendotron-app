ActiveAdmin.register Slot do

  belongs_to :item, optional: true

  actions :all, except: [:new, :destroy]

  permit_params :item_id

  index do
    column :column
    column :row
    column :item
    actions
  end

  filter :column
  filter :row

  form do |f|
    f.inputs "Slot Details" do
      f.input :item
    end
    f.actions
  end

end
