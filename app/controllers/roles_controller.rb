class RolesController < ApplicationController
  def index
    @roles = Role.all
  end

  def show
    @role = Role.find(params[:id])
  end

  def new
    @role = Role.new
  end

  def create
    @role = Role.new(role_params)
    if @role.save
      flash[:success] = t('.success')
      redirect_to roles_url
    else
      render 'new'
    end
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
    @role = Role.find(params[:id])
    if @role.update_attributes(role_params)
      flash[:success] = t('.success')
      redirect_to @role
    else
      render 'edit'
    end
  end

  def destroy
    Role.find(params[:id]).destroy
    flash[:success] = t('.success')
    redirect_to roles_url
  end

  private

  def role_params
    params.require(:role).permit(:name)
  end
end
