class Api::V1::PostsController < Api::V1::BaseController

  def index
    page = params[:page]
    per_page = params[:per_page]

    @posts = Post.paginate(page: page, per_page: per_page)
    render json: @posts
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
