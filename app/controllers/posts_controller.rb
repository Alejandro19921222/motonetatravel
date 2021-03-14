class PostsController < ApplicationController
  def index
    @posts = Post.published.order("created_at DESC")
    if params[:tag_id] != nil
      @tag = Tag.find(params[:tag_id])
      @posts = @tag.posts.all
    end
    # draft の post に紐づく tag は表示しない
    @tag_list = @posts.flat_map { |post| post.tags }.compact.uniq
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @post_comment = PostComment.new
    @posts = Post.published.order("created_at DESC")
    @post_tags = @post.tags
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      save_tag
      redirect_to post_path(@post), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      save_tag
      redirect_to posts_path, notice: "You have created post successfully."
    else
      @post = Post.new
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title,:body,:post_image, :draft)
  end

  def save_tag
    tag_list = params[:post][:tag_name].split(nil)
    @post.save_tag(tag_list)
  end
end
