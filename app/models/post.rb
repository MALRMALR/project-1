class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :attachment, :styles => { :medium => "500x500>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates :title, :date, presence: true

  def strip_link
    link = self.embed_link # sets link equal to embed_link paramater in Post class object
    if link.include? 'youtube'
      self.embed_link = link[-11..-1]
    elsif link.include? 'Vimeo'
      self.embed_link = link[-9..-1]
    elsif link.include? 'soundcloud' && 'tracks'
      self.embed_link = link.scan(/tracks\/\d{1,}/).first # Scans embed link for 'tracks/then all numbers', .first returns first object that meets this specification
    elsif link.include? 'soundcloud' && 'playlists'
      self.embed_link = link.scan(/playlists\/\d{1,}/).first
    else
      self.embed_link
    end
  end
end
