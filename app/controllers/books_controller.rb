class BooksController < ApplicationController

  def index
     @books = Book.all
     @book = Book.new
  end

  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    #book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    #book.save
    # 4. トップ画面へリダイレクト
    #redirect_to '/books'
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


  #def update
   # book = Book.find(params[:id])
    #book.update(book_params)
    #redirect_to book_path(book.id)
  #end

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