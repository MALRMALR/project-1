class Post < ActiveRecord::Base
  has_many :tags #, dependent: :destroy
  belongs_to :user
  validates :title, :date, presence: true
end
