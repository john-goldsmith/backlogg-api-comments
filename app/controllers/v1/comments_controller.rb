# See https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one
# See http://sourcey.com/building-the-prefect-rails-5-api-only-app/

module V1

  class CommentsController < ApiController

    include V1::Concerns::Docs::CommentsController

    before_action :set_comment, only: [:show, :update, :destroy]

    # default_scope { where active: true }
    # scope :inactive, -> { where active: false }

    #
    # GET /
    #
    # @return [type] [description]
    def index
      respond_with Comment.where user_id: index_params
    end

    #
    # POST /
    #
    # @return [type] [description]
    def create
      @comment = Comment.create! comment_params
      respond_with @comment, :created
    end

    #
    # GET /:id
    #
    # @return [type] [description]
    def show
      respond_with @comment
    end

    #
    # PUT /:id
    #
    # @return [type] [description]
    def update
      @comment.update comment_params
      respond_with @comment
    end

    #
    # DELETE /:id
    #
    # @return [type] [description]
    def destroy
      @comment.destroy
      respond_with '', :no_content
    end

    private

    #
    # [comment_params description]
    #
    # @return [type] [description]
    def comment_params
      params.require(:comment).permit(:body, :user_id)
    end

    def index_params
      params.require(:user_id)
    end

    #
    # [set_user description]
    #
    # @return [type] [description]
    def set_comment
      @comment = Comment.find params[:id]
    end

  end

end