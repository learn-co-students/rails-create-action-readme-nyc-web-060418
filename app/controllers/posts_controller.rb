class PostsController < ApplicationController
	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new
		@post.title = params[:title]
		@post.description = params[:description]
		@post.save
		# will give arror that it can't find a template for create, trying to find create.html.erb
		# rails tries to map each controller action directly to a template
		# just want action to communicate with DB and redirect to to a different show page
		redirect_to posts_path(@post)
	end

	# ways to check if the record was successfully created
	# 1) Post.last will display the most recently created record in RAILS CONSOLE, created at has time stamp
	# 2) can find INSERT INTO sql statement
end
