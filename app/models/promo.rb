class Promo < ActiveRecord::Base
  belongs_to :resto

  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def image_url
    avatar.url(:medium)
  end

  
  def final_price
    discount = self.discount * self.price / 100
    self.price - discount
  end

end

