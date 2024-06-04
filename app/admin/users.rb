ActiveAdmin.register User do
  # Разрешаемые параметры для создания/обновления пользователя
  permit_params :email, :password, :password_confirmation, :name, :age, :admin

  # Конфигурация отображения индекса пользователей
  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :admin
    actions
  end

  # Конфигурация формы для создания/редактирования пользователя
  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :name
      f.input :age
      f.input :admin, as: :boolean
    end
    f.actions
  end

  # Конфигурация отображения шоу-страницы пользователя
  show do
    attributes_table do
      row :id
      row :email
      row :created_at
      row :updated_at
      row :admin
    end
    active_admin_comments
  end

  # Фильтры для панели администратора
  filter :email
  filter :created_at
  filter :admin
end
