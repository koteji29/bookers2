class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  # 投稿データの保存
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @current_user = current_user
      @books = Book.all
      render :index
    end
  end
  #一覧
  def index
    @current_user = current_user
    @books = Book.all
    @book = Book.new
  end
  #詳細
  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
  end
  # 編集
  def edit
    @book = Book.find(params[:id])
    unless @book.user.id == current_user.id
      redirect_to books_path
    end
  end
  #更新
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      flash[:notice] = "error"
      render 'edit'
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

   # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
