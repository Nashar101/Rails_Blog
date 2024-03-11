class Reply < ApplicationRecord
  belongs_to :comment, optional: true

  def time
    created_at.strftime("at %l:%M %p (%m/%d/%y)")
  end
end
