class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :profile_picture
  has_rich_text :bio


  def header_picture
    profile_picture.variant(resize_to_fill: [100, 100]).processed
  end

  def comment_picture
    profile_picture.variant(resize_to_fill: [50, 50]).processed
  end
end
