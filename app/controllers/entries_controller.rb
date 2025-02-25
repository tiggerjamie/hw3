class EntriesController < ApplicationController
  
  def new
  end

  def create
    @place = Place.new
    # assign user-entered form data to places's columns
    @place["name"] = params["name"]
    @place["created_at"] = params["created_at"]
    @place["updated_at"] = params["updated_at"]
    # save Company row
    @place.save
    # redirect user
    redirect_to "/entry"
  end

end
