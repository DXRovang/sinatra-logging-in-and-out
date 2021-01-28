require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    if User.find_by(username: params[:username])
      @user = User.find_by(username: params[:username])
      session[:user_id] = @user.id
      binding.pry
      redirect to '/account'
    else
      erb :error
    end
    # find the user in the database based on their username.
    # f there is a match, set the session to the user's ID, 
    # redirect them to the /account route (using redirect to), 
    # and use ERB to display the user's data on the pag
    # If there is no match, render the error page.
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
  end


end

