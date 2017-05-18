class DosesController < ApplicationController
  def new
     @cocktail = Cocktail.find(params[:cocktail_id])
     @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    if @dose.save
      redirect_to dose_path(@dose)
    else
      @dose
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end

end
