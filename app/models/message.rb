class Message < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  belongs_to :question, optional: true
end
