ActiveAdmin.register Item do
  #各種パラメータの入力を許可
  permit_params :genre_id, :item_image, :name, :area,
    relationship_item_areas_attributes: [ :id, :area_id ]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :genre_id, :name, :image_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:genre_id, :name, :image_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  

  form do |f|
    f.inputs do
      f.input :item_image, as: :file
      f.input :genre_id, as: :select, collection: Genre.all
      f.input :name
    end

    f.inputs do #地域の選択肢をArea一覧から作成
      f.has_many :relationship_item_areas do |p|
        p.input :area, as: :select, collection: Area.all
      end
    end
    f.actions
  end
end
