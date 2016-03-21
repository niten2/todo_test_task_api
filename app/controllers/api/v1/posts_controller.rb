class Api::V1::PostsController < Api::V1::BaseController

  def index
    page = params[:page]
    per_page = params[:per_page]

    @posts = Post.order('published_at DESC').paginate(page: page, per_page: per_page)
    respond_with @posts
  end

  def show
    # binding.pry
    @post = Post.where(id: params[:id]).take
    respond_with @post
  end

  def create
    # respond_with Post.create(question_params)
  end

private

  # def post_params
  #   params.require(:post).permit(:title, :body)
  # end

end
