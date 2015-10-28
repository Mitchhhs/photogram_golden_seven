class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all
  end

  def show
    @specific_photo = Photo.find(params[:id])

  end

  def new_form

    render('photos/new.html.erb')

  end

  def create_row

    row = Photo.new
    row.source= params[:the_caption]
    row.caption = params[:the_source]
    row.save

    redirect_to("http://localhost:3000/photos")
  end

  def destroy

    row = Photo.find(params[:id])
    row.destroy


    redirect_to("http://localhost:3000/photos")
  end

  def edit_form
    @photo = Photo.find(params[:id])
    @action = "http://localhost:3000/update_photo/" + params[:id]

  end

  def update_row
    row = Photo.find(params[:id])
    row.caption= params[:the_caption]
    row.source = params[:the_source]
    row.save


    url = "http://localhost:3000/photos/" + params[:id]

    redirect_to(url)
  end


end
