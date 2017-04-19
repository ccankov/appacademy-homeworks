class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    render :new
  end

  def create
    if Book.create(book_params)
      redirect_to '/books'
    else
      render text: 'Create failed.'
    end
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
