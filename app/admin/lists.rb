ActiveAdmin.register List do
  permit_params :name, list_items_attributes: [ :name ]

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "List Details" do
      f.input :name
      f.has_many :list_items do |item|
        item.input :name
      end
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
    panel "List Items" do
      items = list.list_items
      table_for items do
        column :name
      end
    end
  end
end
