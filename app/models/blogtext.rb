class Blogtext < ApplicationRecord

  has_rich_text :blogpost
  has_many :comments, dependent: :destroy


end
