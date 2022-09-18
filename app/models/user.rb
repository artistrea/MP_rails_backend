class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :user_type, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 2 }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
