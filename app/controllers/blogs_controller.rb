class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:destroy, :new, :create, :edit, :update, :myblogs] #metodo para no destruir sin estar logeado


 # metodo para mostrar MIS PINS. (LOS PINS DE UN USUARIO LOGUEADO.)

 def contactme
  @blog = Blog.find(params[:id])
  render layout: "bloglayout/blogindex"


 end

  def myblogs
    @blogs = current_user.blogs   
  end



  # GET /blogs
  # GET /blogs.json
  def index
    @blogs = Blog.all.sorted
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show     
  #@post = Post.new
  #carga de vars antes del render
  #@blog_id = params[:id]
  #@blog =Blog.find(@blog_id)
  # @posts =@blog.posts

    #aqui cargamos un objeto post
    @post = Post.new blog: @blog
    @posts = @blog.posts.sorted

    #@toys = Toy.sorted
     render layout: "bloglayout/blogindex"
     
  end

  # GET /blogs/new
  def new
    @blog = Blog.new
    @b = Blog.all

     
  @categories = Category.all


  end

  # GET /blogs/1/edit
  def edit
    @blog = Blog.find(params[:id])
    @categories = Category.all

  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    #aqui agregamos el id del usuario logueado y lo asociamos al nuevo blog creado
    @blog.user_id   =   current_user.id
 
    respond_to do |format|
      if @blog.save
        format.html { redirect_to root_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    respond_to do |format|
      if @blog.update(blog_params)
        format.html { redirect_to @blog, notice: 'Blog was successfully updated.' }
        format.json { render :show, status: :ok, location: @blog }
      else
        # format.html { render :edit }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    respond_to do |format|
      format.html { redirect_to blogs_url, notice: 'Blog was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
       @blog = Blog.find(params[:id])
       
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:siteTitle, :siteDescription, :siteHeader, :user_id, :category_id)
    end
end
