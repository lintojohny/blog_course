class PostsController < ApplicationController
	before_action :find_post, only: [:show, :edit, :update, :distroy]
	def index
	end

	def new
		@post = Post.new	
	end

	def create
		@post = Post.new post_params

		if @post.save

			redirect_to @post, notice: "hello linto! your article was sussesfully saved!!"
		else
			render 'new', notice: "oh no, linto! i was unable to save your post. "
		end
		
	end

	def show
	end

	def edit
		
	end



	def update
		if @post.update post_params
			redirect_to @post, notice: "huzzah! your article was sussesfully saved!"
		else
			render
		end
			
		end
		
	end

	def distroy
		@post.distroy
		redirect_to posts_path
		
	end

	private

	def post_params
		params.require(:post).permit(:title, :content)
		
	end

	def find_post
		@post = Post.find(params[:id])
	end

