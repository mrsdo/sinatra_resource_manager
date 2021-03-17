# frozen_string_literal: true

# Roles
class RolesController < ApplicationController
  # READ all roles
  get '/roles' do
    @roles = Role.all
    erb :'roles/index'
  end

  # CREATE new role (render form)
  get '/roles/new' do
    erb :'roles/new'
  end

  # READ 1 role
  get '/roles/:id' do
    @role = Role.find_by_id(params[:id])
    erb :'roles/show'
  end

  # CREATE new role (save in db)
  post '/roles' do
    role = Role.new(name: params["name"])

    if role.save
      redirect "/roles/#{role.id}"
    else
      redirect "/roles/new"
    end
  end

  # UPDATE 1 role (render form)
  get '/roles/:id/edit' do
    @role = Role.find_by_id(params[:id])
    erb :'roles/edit'
  end

  # UPDATE 1 role (save in db)
  patch '/roles/:id' do
    role = Role.find_by_id(params[:id])
    role.title = params["title"]

    if role.save
      redirect "/roles/#{role.id}"
    else
      redirect "/roles/#{role.id}/edit"
    end
  end

  # DELETE 1 role
  delete "/roles/:id" do
    role = Role.find_by_id(params[:id])
    role.destroy

    redirect "/roles"
    end
end
