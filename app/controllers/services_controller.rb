class ServicesController < ApplicationController
  before_action :set_service, only: [ :show, :edit, :update, :destroy ]
  def show
    # @service = Service.first()
    # @service = Service.find(params[:id])
  end

  def index
    @services = Service.all
  end

  def create
    @service = Service.new(service_params)

    if !@service.save
      render :new, status: :unprocessable_entity
    else
      redirect_to service_path(@service), notice: "Service was successfully created."
    end
  end

  def new
    @service = Service.new
  end

  def destroy
    if @service.destroy
      redirect_to services_path, notice: "Service was successfully deleted."
    else
      redirect_to service_path(@service), alert: "Failed to delete the service."
    end
  end

  def update
    if @service.update(service_params)
      redirect_to service_path(@service), notice: "Service was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    # @service = Service.find(params[:id])
  end

  # private method for params
  private
  def service_params
    params.require(:service).permit(:name, :description, :price)
  end

  def set_service
    @service = Service.find(params[:id])
  end
end
