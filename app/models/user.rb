class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_group_combinations, dependent: :destroy
  has_many :join_groups, through: :user_group_combinations, source: :group
  has_many :participating_user_group_combinations, -> { where( status: 'is_participating' ) }, class_name: 'UserGroupCombination'
  has_many :participating_join_groups, through: :participating_user_group_combinations, source: :group
  has_many :owner_groups, class_name: "Group", foreign_key: :owner_id
  has_many :inquiries

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

  def join_group(group)
    user_group_combination = self.user_group_combinations.find_or_create_by(group: group)
    if user_group_combination.status == 'is_rejected'
      user_group_combination.update(status: 'is_pending')
    end
  end

  def reject_group(group)
    self.user_group_combinations.find_by(group: group)&.destroy
  end

  def join_group?(group)
    self.join_groups.include?(group)
  end
end
