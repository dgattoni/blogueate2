class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!, only: [:destroy, :create, :update, :show] #metodo para no destruir sin estar logeado


  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show

   @blog =Blog.find_by_slug(params[:blog_id])


    #instancio un nuevo comment
    @comment = Comment.new post: @post
    

    #recopilo todos los comments del post actual.
    @comments = @post.comments.all

    @count_comments = @post.comments.count
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  #@blog.user.username  
  # <%= @blog.id %>
  def create


  #asignamos al objeto pin un registro que corresponde a pin_id que estamos evaluando, en la url
  @blog =Blog.find_by_slug(params[:blog_id])
  #
  @post = Post.new(post_params)

  #al comentario le asocio un pin especifico, el cargado en memoria, a esto le asigno el objeto @pin
  @post.blog = @blog

  #guardo el objeto pin llamando a su metodo .save
  @post.save

  #finbalmente se redirige al al pin con el comentario /pìn/1
  redirect_to @blog
    
     
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:entryTitle, :entryContent, :blog_id)
    end
end
