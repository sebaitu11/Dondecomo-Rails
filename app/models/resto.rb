class Resto < ActiveRecord::Base
  include PgSearch

  acts_as_mappable :default_units => :kms,
                   :default_formula => :sphere,
                   :distance_field_name => :distance

  attr_accessor :distance

  belongs_to :owner
  belongs_to :resto_tipo
  has_many :promos
  has_many :menus
  has_many :subscriptions

  has_attached_file :avatar, styles: {
    thumb: '160x160>',
    medium: '300x300>',
    large: '800x800>'
  },

  :url => ':s3_alias_url',
  :s3_host_alias => 'd27tkdf0qa4ye1.cloudfront.net'

  validates_attachment_size :avatar, less_than: 2.megabyte

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  after_destroy :refresh_cache
  after_save :refresh_cache

  pg_search_scope :search, :against => [:name],:using => { :tsearch => {:prefix => true} }

  validates :details, presence: true


  def calculate_distance(location)
    self.distance = self.distance_to(location,:units=>:kms,:formula => :sphere).round(1)
  end

  def self.cached_restos
    Rails.cache.fetch("restos") { where(online: true).to_a }
  end

  def refresh_cache
    Rails.cache.delete("restos")
  end

  def set_online
    self.online = true
    save
  end

  def past_due?
    self.subscriptions.where(active: true).blank?
  end

end
