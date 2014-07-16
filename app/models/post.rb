class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :attachment, :styles => { :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates :title, :date, presence: true

  def strip_link
    link = self.embed_link
    if link.include? 'youtube'
      self.embed_link = link.scan(/=\p{Alnum}*/).first.gsub(/[=]/, '')
    elsif link.include? 'vimeo'
      self.embed_link = link.scan(/m\/\p{N}*/).first.gsub(/[m\/\/]/, '')
    elsif link.include? 'tracks'
     self.embed_link = link.scan(/tracks\/\d{1,}/).first
    elsif link.include? 'playlists'
     self.embed_link = link.scan(/playlists\/\d{1,}/).first
    end
    return link
  end

end
