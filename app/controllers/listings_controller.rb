# frozen_string_literal: true

# Listings
class ListingsController < ApplicationController

  get "/listings" do
    @listing = Listing.all
    erb :"/listings/index.html"
  end

  # new
  get '/listings/new' do
    @listing = Listing.new
    erb :"/listings/new.html"
  end

  # create
  post '/listings' do
    @listing = Listing.create(params)
    redirect to "/listings/#{@listing.id}"
  end

  # show
  get '/listings/:id' do
    @listing = Listing.find(params[:id])
    erb :"/listings/show.html"
  end

  # edit
  get '/listings/:id/edit' do
    @listing = Listing.find(params[:id])
    erb :"/listings/edit.html"
  end

  # update
  patch '/listings/:id' do
    @listing = Listing.find(params[:id])
    @listing.update(params[:listing])
    redirect to "/listings/#{@listing.id}"
  end

  # destroy
  delete '/listings/:id' do
    Listing.destroy(params[:id])
    redirect to '/listings'
  end

  def destroy
    Listing.destroy(params[:id])
    redirect to '/listings'
  end

end
