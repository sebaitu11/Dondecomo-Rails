ActiveAdmin.register Resto do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :name, :details, :avatar, 
              :telefono, :open, :close, :is_premium, :hasTickets, :hasParking, :hasDelivery,
              :hasWifi, :hasReservas,:resto_tipo_id, :lat, :lng, :direccion, :owner_id, :online
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end
# 
  filter :name
  index do
    column :name
    column :details
    column :telefono
    column "owner" do |r|
      if r.owner
        r.owner.email
      else
        "Sin Dueño"
      end
    end
    actions
  end


  form do |f|
    f.inputs 'Info Basica' do
      f.input :name
      f.input :details, label: "Detalles"
      f.input :telefono, label: "telefono"
      f.input :open, label: "apertura"
      f.input :close, label: "cierre"
      f.input :hasReservas, label: "Reservas"
      f.input :hasParking, label: "Estacionamiento"
      f.input :hasWifi, label: "Wifi"
      f.input :hasTickets, label: "Cheque Restaurant"
      f.input :hasDelivery, label: "Delivery"
      f.input :resto_tipo_id, as: :select, collection: RestoTipo.all.map{|r|["#{r.name}", "#{r.id}"]} 
      f.input :lat, label: "latitud"
      f.input :lng, label: "longitud"
      f.input :direccion, label: "dirección"
      f.input :avatar, as: :file
      f.input :owner_id , as: :select, collection: Owner.all.map{|u|["#{u.email}", "#{u.id}"]}
      f.input :online, label: "online?"
    end
    actions
  end


end
