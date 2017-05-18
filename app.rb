require 'sinatra'
require 'sinatra/activerecord'


set :database, "sqlite3:firstdb.sqlite3"
set :sessions, true
require './models'


get "/" do

  erb :index
end


post '/signup' do
  @username = params[:username]
  @password = params[:password]

  User.create(username: @username, password: @password)

  currentUser = User.where(username: @username).first

  session[:user_id] = currentUser.id

  redirect "/profile"


end

get "/profile" do
  @user = User.find(session[:user_id])
	@blogs = @user.blogs

  erb :profile

end

post "/profile" do
  user = User.find(session[:user_id])

  Blog.create(title: params[:title],category: params[:category] , content: params[:content] , user_id: user.id)

  redirect "/profile"
end

get "/content" do
  @user = User.find(session[:user_id])
  @title= params[:title]
  @blogpost = @user.blogs.where(title: @title ).first


  currentUser = User.where(username: @username).first
  session[:blog_id] = @blogpost.id

  @blog = Blog.find(session[:blog_id]).comments
  @comments = @blog

  erb :content
end

post "/content" do
  user = session[:user_id]
  blogpost = session[:blog_id]

  Comment.create(acomment: params[:acomment],user_id: user, blog_id: blogpost)
  redirect "/content"
end
