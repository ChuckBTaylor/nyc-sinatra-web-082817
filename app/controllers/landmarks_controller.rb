class LandmarksController < ApplicationController

  set :views, "app/views/landmarks"



  get '/landmarks/:id/edit' do
    @landmark = Landmark.find(params[:id])
    erb :edit
  end

  post '/landmarks' do
    @landmark = Landmark.create(params[:landmark])

    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/new' do
    erb :new
  end

  patch '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    @landmark.update(params[:landmark])
    
    redirect to "/landmarks/#{@landmark.id}"
  end

  get '/landmarks/:id' do
    @landmark = Landmark.find(params[:id])
    erb :show
  end

  get '/landmarks' do
    erb :index
  end

end
