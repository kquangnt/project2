class OrderDetail < ApplicationRecord
  belongs_to :order
  has_many :books
end
