class Blogtext < ApplicationRecord

  validates_presence_of :title, :text
  belongs_to  :user
  has_many    :comments
end
