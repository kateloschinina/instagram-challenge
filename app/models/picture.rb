class Picture < ApplicationRecord
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/lib/images/default.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
