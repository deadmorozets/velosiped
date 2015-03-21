class OccupationsController < ApplicationController
  
  before_action :find_occupation, only: [:edit, :update, :destroy]

  def index
    @occupations = Occupation.all
  end

  def new
    @occupation = Occupation.new
  end

  def create
    @occupation = Occupation.new(occupation_params)
    if @occupation.save
      redirect_to occupations_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @occupation.update(occupation_params)
      redirect_to occupations_path
    else 
      render :edit
    end
  end

  def destroy
    @occupation.destroy
    redirect_to occupations_path
  end

  private

  def find_occupation
    @occupation = Occupation.find(params[:id])
  end

  def occupation_params
    params.require(:occupation).permit(:name)
  end

end
