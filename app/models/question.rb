class Question < ApplicationRecord
  has_many :messages, dependent: :destroy
  validates :title, presence: true, length: { maximum: 50 }
  validates :a_1, presence: true, length: { maximum: 50 }
  validates :a_2, presence: true, length: { maximum: 50 }
  validates :a_3, presence: true, length: { maximum: 50 }
  validates :a_4, presence: true, length: { maximum: 50 }
  validates :answer, presence: true, inclusion: { in: [*1..4] }
end
