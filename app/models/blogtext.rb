class Blogtext < ApplicationRecord

  validates_presence_of :title, :text
  # validates :title,    length: { maximum: 12 }
  belongs_to  :user
  has_many    :comments
  
end
