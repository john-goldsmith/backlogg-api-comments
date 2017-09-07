module V1

  class CommentSerializer < ApiSerializer

    attributes :id,
               :body,
               :user_id,
               :created_at,
               :updated_at

  end

end