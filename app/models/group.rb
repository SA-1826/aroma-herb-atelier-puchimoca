class Group < ApplicationRecord
  has_one_attached :image

  belongs_to :owner, class_name: 'User'
  has_many :user_group_combinations, dependent: :destroy
  has_many :users, through: :user_group_combinations, source: :user

  validates :name, presence: true
  validates :body, presence: true

  def users_include_owner
    User.where(id: (UserGroupCombination.is_participating).where(user_id: self.users.ids).pluck(:user_id)).or(User.where(id: self.owner.id))
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image
  end

  def is_owned_by?(user)
    owner.id == user.id
  end
  
  def includesUser?(user)
    group_users.exists?(user_id: user.id)
  end
end
