class PostsController < ApplicationController
  before_action :set_post,only: [:edit,:update,:destroy]
  before_action :authenticate_user!

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  #newの投稿ボタンを押すとcreateメソッドが呼ばれる。
  #createメソッドの中にDBを保存する記述をする記述をすればDBに保存できる。
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update

    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy

    @post.destroy
    redirect_to posts_path
  end

  #引数post_paramsの定義
  #params.require(自動保管) postのモデルの中の何を許可するのか
  private
    def post_params
      params.require(:post).permit(:title,:content)
    end
  def set_post
    @post = Post.find(params[:id])
  end
end
