class PlacesController < ApplicationController

  def index
    # Retrieve all Place records from the database
    @places = Place.all
  end

  def show
    # Find a specific Place using its ID from the request parameters
    @place = Place.find_by(id: params[:id])
    # Get all associated Entry records for the found Place
    @entries = Entry.where(place_id: @place.id)
  end

  def new
    # Action for initializing a new Place form
  end

  def create
    # Instantiate a new Place object with parameters from the form
    @place = Place.new(name: params[:name])
    # Save the new Place to the database
    if @place.save
      # Redirect the user to the list of all Places on successful save
      redirect_to places_path
    else
      # Handle the save failure (e.g., render the 'new' template again)
    end
  end

end
