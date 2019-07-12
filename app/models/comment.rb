class Comment < ApplicationRecord

  # validates_presence_of :comment
  validates :comment, presence: true
  belongs_to  :user
  belongs_to  :blogtext

end
