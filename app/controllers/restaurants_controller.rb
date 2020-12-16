class RestaurantsController < ApplicationController
  before_action :set_restaurant,only: [:edit, :show, :update, :destroy]
  def index
    @restaurants = Restaurant.all
    @restaurants = Restaurant.all.by_new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, notice: "データを保存しました。"
    # restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_path, notice: "データを更新しました。"
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path, notice: "データを削除しました。"
  end

  private

  def restaurant_params
    params[:restaurant].permit(
      :name,
      :address,
      :telephone,
    )
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
