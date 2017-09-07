class Comment < ApplicationRecord

  include Docs::Comment

  validates :body, presence: true
  # validates :user_id, presence: true
  validates :user_id, presence: true

end
