class BooksController < ApplicationController
    

  
  def index
   @books = Book.all
   @user = current_user
   @book = Book.new
  end
  
  def show
   @book = Book.find(params[:id])
   @user = @book.user
   @newbook = Book.new
  end      
  
  def edit
   @book = Book.find(params[:id])
    unless @book.user == current_user
        redirect_to books_path
    end
  end
      
   def update
      @book =Book.find(params[:id])
   if @book.update(book_params)
      redirect_to book_path, notice: "You have updated book successfully."
   else
      render :edit
   end
   end
   
   def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
   end
  
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book.id), notice: "You have posted successfully."
   else
    @user = current_user
    @books = Book.all
    render :index
   end
  end  
  
  def new
    @book=Book.new
  end
  

  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
