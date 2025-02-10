class Expense < ApplicationRecord
  CATEGORIES = ['Food', 'Leisure', 'Travel']

  validates :amount, numericality: { greater_than: 0, only_integer: false }
  validates :notes, presence: true
  validates :category, inclusion: { in: CATEGORIES}

  belongs_to :user
end
