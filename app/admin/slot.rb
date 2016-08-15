ActiveAdmin.register Slot do

  belongs_to :item, optional: true

  actions :all, except: [:new, :destroy]

  permit_params :item_id, :empty

  index do
    column :column
    column :row
    column :item
    column :empty
    actions
  end

  filter :column
  filter :row
  filter :empty

  form do |f|
    f.inputs "Slot Details" do
      f.input :item
      f.input :empty, as: :boolean
    end
    f.actions
  end

end
