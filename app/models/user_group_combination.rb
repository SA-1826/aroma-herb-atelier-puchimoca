class UserGroupCombination < ApplicationRecord
  belongs_to :user
  belongs_to :group

  enum status: { is_pending: 0, is_participating: 1, is_rejected: 2 }
  
  scope :is_participating, -> { where(status: "is_participating") }
end
