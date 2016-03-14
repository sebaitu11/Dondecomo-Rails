class ApiRestoSerializer < ActiveModel::Serializer
  attributes :id, :details, :image, :distance, :name, :tipo

  def tipo
    if object.resto_tipo then object.resto_tipo.name else "Sin Tipo" end
  end

  def image
    missing_url = "https://dondecomo.herokuapp.com/avatars/medium/missing.png"
    
    if object.avatar_file_name != nil then object.avatar.url(:medium) else missing_url end
  end
end
