class FiguresController < ApplicationController

  set :views, "app/views/figures"

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])

    erb :edit
  end

  get '/figures/new' do
    erb :new
  end

  patch '/figures/:id' do
    # binding.pry
    @figure = Figure.find(params[:id])
    @figure.update(params[:figure])
    unless params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end
    unless params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :show
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
      
    unless params[:title][:name].empty?
      @title = Title.create(params[:title])
      @figure.titles << @title
    end

    unless params[:landmark][:name].empty?
      @landmark = Landmark.create(params[:landmark])
      @figure.landmarks << @landmark
    end
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures' do
    erb :index
  end

  get '/' do
    erb :index
  end

end
