class ProfessionalsController < ApplicationController

  def index
    @professionals = policy_scope(Professional)
  end

  def show
    @professional = Professional.find(params[:id])
    authorize @professional
  end

  def new
    @professional = Professional.new
    authorize @professional
  end

  def create
    @professional = Professional.new(professional_params)
    @professional.user = current_user
    authorize @professional

    if @professional.save
      redirect_to professional_path(@professional)
    else
      render :new
    end
  end

  def edit
    @professional = Professional.find(params[:id])
    authorize @professional
  end

  def update
    @professional = Professional.find(params[:id])
    authorize @professional
    if @professional.update(professional_params)
      redirect_to professional_path(@professional)
    else
      render :edit
    end
  end

  def destroy
    @professional = Professional.find(params[:id])
    authorize @professional

    @professional.destroy
    flash[:notice] = "Professional profile was successfully destroyed"
    redirect_to(:action => 'index')
  end

  private

  def professional_params
    params.require(:professional).permit(:full_name, :role, :details, :price, :email, :phone, :address, :photo)
  end

end
