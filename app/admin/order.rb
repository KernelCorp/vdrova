ActiveAdmin.register Order do
  actions :all
  config.filters = false

  index do
    column :created_at
    column :username
    column :phone
    column :text
    column :updated_at
    default_actions
  end

  show do
    attributes_table do
      row :created_at
      row :username
      row :phone
      row :text
      row :updated_at
    end
  end

end