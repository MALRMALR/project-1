class User < ActiveRecord::Base
  has_secure_password
  has_many :posts, dependent: :destroy
  has_attached_file :avatar, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :username, :first_name, :last_name, presence: true
  validates :username, uniqueness: true

end
