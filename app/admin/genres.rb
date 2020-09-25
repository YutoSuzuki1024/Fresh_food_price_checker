ActiveAdmin.register Genre do
  #ジャンル名の入力を許可
  permit_params :name
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :name, :is_deleted
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :is_deleted]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
