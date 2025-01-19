class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable
  
  devise authentication_keys: [:email]
  
  has_many :programs, dependent: :destroy
end
