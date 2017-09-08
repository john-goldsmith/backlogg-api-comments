class Comment < ApplicationRecord

  include Docs::Comment
  has_paper_trail

  validates :body, presence: true
  # validates :user_id, presence: true
  validates :user_id, presence: true

end
