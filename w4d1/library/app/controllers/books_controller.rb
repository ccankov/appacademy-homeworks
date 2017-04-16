class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    # your code here
  end

  def create
    # your code here
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to '/books'
    else
      render text: 'Delete failed.'
    end
  end

  private
  
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
