class User < ApplicationRecord
  has_many :reviews
  has_many :orders, dependent: :destroy

  # validates :name, presence: true, length: {maximum: 255}
  # validates :telephone, presence: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
end
