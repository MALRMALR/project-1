class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user
  has_attached_file :attachment, :styles => { :medium => "800x800>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :attachment, :content_type => /\Aimage\/.*\Z/
  validates_attachment_size :attachment, :less_than => 5.megabytes
  validates :title, :date, presence: true

  def strip_link
    link = self.embed_link # sets variable link equal to embed link paramater of an instance of the class Post
    if link.include? 'youtube'
      self.embed_link = link[-11..-1] # this sets embed_link paramater of instance of Post class to the last 10 digits of the link
    elsif link.include? 'vimeo'
      self.embed_link = link[-9..-1]
    elsif link.include? 'soundcloud'
      self.embed_link = link.scan(/tracks\/\d{1,}/).first # Reg Exp scans embed link for 'tracks'/then all numbers', calls .first method on link variable and returns first colelction of characters (from a string) that meets this specification
    end
  end

end
