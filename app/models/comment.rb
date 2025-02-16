class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: :true

  def self.search_for(content, method)
    if method == 'perfect'
      Comment.where(body: content)
    elsif method == 'forward'
      Comment.where('body Like ?', content + '%')
    elsif method == 'backword'
      Comment.where('body Like ?', '%' + content)
    else
      Comment.where('body Like ?', '%' + content + '%')
    end
  end
end
