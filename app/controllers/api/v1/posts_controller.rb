class Api::V1::PostsController < Api::V1::BaseController

  def index
    # respond_with Post.all, each_serializer: PostCollectionSerializer
  end

  def show
    # respond_with Post.find(params[:id])
  end

  def create
    # respond_with Post.create(question_params)
  end

private

  # def post_params
  #   params.require(:post).permit(:title, :body)
  # end

end
