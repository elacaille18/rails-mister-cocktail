class DosesController < ApplicationController
  before_action :find_cocktail, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_dose, only: [:edit, :update, :destroy]


  def create
    @dose = @cocktail.doses.build(dose_params)
    # je crée la dose avec la dependance vis a vis
    # du cocktail de find_cocktail dans before action
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @dose.update(dose_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy

    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id) # rajouter ingredient id
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
