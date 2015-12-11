class RolesController < ApplicationController
  allow_access :authenticated
  before_filter :find_role, only: [:show, :edit, :update]

  def index
    @roles = Role.all
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      redirect_to roles_url
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @role.update_attributes(role_params)
      redirect_to role_path(@role)
    else
      render :edit
    end
  end

  private

  def find_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name, :definition)
  end
end
