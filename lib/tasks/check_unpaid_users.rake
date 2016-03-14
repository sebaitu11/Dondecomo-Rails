require 'rake'

namespace :past_due do
  task :check => :environment do
    Subscription.cancel_past_dues_subscriptions
  end

end

task :create_restos => :environment do
  
  15.times do
    resto = Resto.create(name: 'Resto Prueba', 
                 details: 'Buena lugar para comer con la familia',
                 telefono: 2928392,
                 direccion: 'Seminario Nº 130 Providencia',
                 tipo: 'Peruano',
                 open: 10,
                 close: 22,
                 admin_id: 1 )
    resto.set_image
  end

end