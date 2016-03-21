class Api::V1::PostsController < Api::V1::BaseController

  def index
    render json: @posts = Post.all
  end

  def show
    render json: @post = Post.where(id: params[:id])
  end

  def create
    # respond_with Post.create(question_params)
  end

private

  # def post_params
  #   params.require(:post).permit(:title, :body)
  # end

end
