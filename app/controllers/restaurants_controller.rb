class RestaurantsController < ApplicationController

  # before_action :set_restaurant, only: %i[show edit update destroy]
  before_action :set_restaurant, only: %i[show]

  def index
    @restaurants = Restaurant.all.sort_by { |r| r[:id] }.reverse!
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.save
    redirect_to @restaurant
  end

  def new
    @restaurant = Restaurant.new
  end

  def show
    @reviews = @restaurant.reviews
    # @reviews = Review.all
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
