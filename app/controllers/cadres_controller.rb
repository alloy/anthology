class CadresController < ApplicationController
  allow_access :authenticated
  before_filter :find_cadre, only: [:show, :edit, :update]

  def index
    @cadres = Cadre.all
  end

  def new
    @cadre = Cadre.new
  end

  def create
    @cadre = Cadre.new cadre_params
    if @cadre.save
      redirect_to cadre_url(@cadre)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @cadre.update cadre_params
        format.html { redirect_to cadres_url }
      else
        format.html { render :edit }
      end
    end
  end

  private

  def find_cadre
    @cadre = Cadre.find params[:id]
  end

  def cadre_params
    params.require(:cadre).permit(:name, :definition)
  end
end
