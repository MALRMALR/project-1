class Post < ActiveRecord::Base
  has_many :tags #, dependent: :destroy
  belongs_to :user
  has_attached_file :attachment, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates :title, :date, presence: true
end
