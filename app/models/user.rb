class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, length: { minimum: 2, maximum: 20}, uniqueness: true, presence: true
  validates :email, presence: true

  def self.search_for(content, method)
    if method == 'perfect'
      User.where(name: content)
    elsif method == 'forward'
      User.where('name Like ?', content + '%')
    elsif method == 'backword'
      User.where('name Like ?', '%' + content)
    else
      User.where('name Like ?', '%' + content + '%')
    end
  end
end
