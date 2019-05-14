
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # get '/' do
  #   @articles = Article.all
  #
  #   erb :index
  # end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    Article.create(name: params[:title], content: params[:content])

    erb :index
  end

  get 'article' do
    @articles = Articles.all

    erb :index
  end

  get 'articles/:id' do
    @article = Article.find(params[:id])

    erb :show
  end

  get '/articles/:id/edit' do
    erb :edit
  end

  patch 'articles/:id' do
    Article.update(params[:id], title: params[:title], content: params[:content])

    erb :show
  end

  delete 'articles/:id' do
    @article = Article.find(params[:id])
    @article.delete

    erb :show
  end

end
