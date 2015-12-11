class WritersController < ApplicationController
  skip_before_action :ensure_valid_writer
  allow_access(:authenticated) { @authenticated.id == params[:id].to_i }

  def edit
    @writer = @authenticated
  end

  def update
    @writer = @authenticated
    if @writer.update_attributes(writer_params)
      redirect_to root_url
    else
      render :edit
    end
  end

  private

  def writer_params
    params.require(:writer).permit(:name, :cadre_id)
  end
end
