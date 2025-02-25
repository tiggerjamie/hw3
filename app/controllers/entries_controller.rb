class EntriesController < ApplicationController
  
  def new
  end

  def create
    @entry = Entry.new
    # assign user-entered form data to entry columns
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["created_at"] = params["created_at"]
    @entry["updated_at"] = params["updated_at"]
    @entry["place_id"] = params["place_id"]
    # save entry row
    @entry.save
    #update the place update_at
    place = Place.find_by("id" => @entry["place_id"])
    place["updated_at"] = Time.current
    place.save
    # redirect user
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
