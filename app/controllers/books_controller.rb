class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Book was successfully updated."
      redirect_to '/books'
    else
      flash[:notice] = "投稿に失敗しました。"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated."
      render :edit   # redirect_to edit
    else
      flash.now[:error] = "本の情報の更新に失敗しました"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])  # データ（レコード）を1件取得
    book.destroy  # データ（レコード）を削除
    redirect_to '/books'  # 投稿一覧画面へリダイレクト
  end

private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end