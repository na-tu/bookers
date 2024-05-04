class HomesController < ApplicationController

def  top
#@books = Book.all
end


private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end