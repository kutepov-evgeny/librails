class BooksController < ApplicationController

  layout 'standard'

  http_basic_authenticate_with name: "dhh", password: "secret", only: :delete

  def list
    @books = Book.all
    @subjects = Subject.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
    @subjects = Subject.all
  end

  def create

    puts params.to_yaml
    puts book_params.to_yaml

    @book = Book.new(book_params)

    if @book.save

      @book.errors.objects.first.full_message => "Invalid book" if @book.invalid?

      redirect_to :action => 'list'
    else
      @subjects = Subject.all
      render :action => 'new'
    end
  end

  def edit
    @book = Book.find(params[:id])
    @subjects = Subject.all
  end

   def update
    @book = Book.find(params[:id])

    if @book.update(book_param)
      redirect_to :action => 'show', :id => @book
    else
      @subjects = Subject.all
      render :edit
    end
  end

  def delete
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to root_path
  end

  def get_from_request
    url = URI.parse('http://httpbin.org/json')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }

    res = JSON.parse(res.body)
    #puts res.to_yaml
    #puts params.to_yaml

    params[:books] = {
      :title => res['slideshow']['author'],
      :price => '3',
      :description => res['slideshow']['date'],
      :subject_id => '1'
    }

    create()


  end


  def show_subjects
      @subject = Subject.find(params[:id])
   end

  private
    def book_params
      params.require(:books).permit(:title, :price, :subject_id, :description)
    end
    def book_param
      params.require(:book).permit(:title, :price, :subject_id, :description)
   end

end
