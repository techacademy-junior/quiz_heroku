class Question < ApplicationRecord
  validates :title, presence: true
  validates :a_1, presence: true
  validates :a_2, presence: true
  validates :a_3, presence: true
  validates :a_4, presence: true
  validates :answer, presence: true
end
