class Photo < ActiveRecord::Base
  belongs_to :imaegeble, :polymorphic => true

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

end
