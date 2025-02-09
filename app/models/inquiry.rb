class Inquiry < ApplicationRecord
  belongs_to :user

  enum status: { still: 0, in_progress: 1, is_done: 2 }

  validates :email, presence: true
  validates :title, presence: true
  validates :body, presence: true
end
