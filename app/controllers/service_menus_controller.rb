class ServiceMenusController < ApplicationController
  before_action :set_service_menu, only: [:show, :edit, :update, :destroy]

  # GET /service_menus
  # GET /service_menus.json
  def index
    @service_menus = ServiceMenu.all
  end

  # GET /service_menus/1
  # GET /service_menus/1.json
  def show
  end

  # GET /service_menus/new
  def new
    @service_menu = ServiceMenu.new
  end

  # GET /service_menus/1/edit
  def edit
  end

  # POST /service_menus
  # POST /service_menus.json
  def create
    @service_menu = ServiceMenu.create(service_menu_params)

    respond_to do |format|
      if @service_menu.save
        format.html { redirect_to @service_menu, notice: 'Service menu was successfully created.' }
        format.json { render :show, status: :created, location: @service_menu }
      else
        format.html { render :new }
        format.json { render json: @service_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_menus/1
  # PATCH/PUT /service_menus/1.json
  def update
    respond_to do |format|
      if @service_menu.update(service_menu_params)
        format.html { redirect_to @service_menu, notice: 'Service menu was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_menu }
      else
        format.html { render :edit }
        format.json { render json: @service_menu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_menus/1
  # DELETE /service_menus/1.json
  def destroy
    @service_menu.destroy
    respond_to do |format|
      format.html { redirect_to service_menus_url, notice: 'Service menu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_menu
      @service_menu = ServiceMenu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_menu_params
      params.require(:service_menu).permit(:user_id, :menu)
    end
end
