class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisement = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisement][:title]
    @advertisement.copy = params[:advertisement][:copy]
    @advertisement.price = params[:advertisement][:price]
    # if advertisement is saved to database
    if @advertisement.save
      # display message using flash[:notice]
      flash[:notice] = "Ad was saved."
      redirect_to @advertisement
    else
      # if advertisement isn't saved to database render a new view
      flash.now[:alert] = "There was an error saving the ad. Please try again."
      render :new
    end
  end
end
