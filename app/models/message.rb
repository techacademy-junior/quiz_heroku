class Message < ApplicationRecord
  validates :content, presence: true
  belongs_to :question, optional: true
end
