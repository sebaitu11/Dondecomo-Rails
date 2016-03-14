ActiveAdmin.register Subscription do
  permit_params :resto_id, :expiration_date, :mode, :active, :amount

  after_save do |sub|
    if sub.expiration_date < Date.today
      sub.update(active: false)
      sub.resto.update(online: false)
    end
  end
end