class Subscription < ActiveRecord::Base
  belongs_to :resto

  def self.subscribe(resto,mode,amount)
    resto.subscriptions.update_all(active: false) unless resto.subscriptions.blank?
    resto.subscriptions << Subscription.new(active: true, expiration_date: 30.days.from_now,
                                          mode: mode, amount: amount)
  end

  def cancel
    self.update(active: false)
    self.resto.update(online: false)
  end

  def self.cancel_past_dues_subscriptions
    past_due_subs = Subscription.where("expiration_date < ?", Date.today)
    past_due_subs.each do |pd|
      pd.cancel
    end
  end
end
