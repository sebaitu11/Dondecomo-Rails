class Menu < ActiveRecord::Base
  belongs_to :resto

  has_attached_file :avatar, :default_url => "img/missing.png",styles: {
    thumb: '160x160>',
    square: '200x200#',
    medium: '300x300>'
  }

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  def image_url
    avatar.url(:medium)
  end

end
