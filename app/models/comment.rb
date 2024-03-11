# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :blogtext, optional: true
  belongs_to :user
  validates_presence_of :comment, :user_id
  has_many :replies, dependent: :destroy
  def time
    created_at.strftime("at %l:%M %p (%m/%d/%y)")
  end
end
