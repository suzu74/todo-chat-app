class Board < ApplicationRecord
  belongs_to :user
  has_many :tasks

  validates :name,  presence: true
  validates :description,  presence: true
end
