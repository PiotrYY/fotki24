class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @fotos = Foto.all
  end

  def show
  end

  def new
    @foto = current_user.fotos.build
  end

  def edit
  end

  def create
    @foto = current_user.fotos.build(foto_params)
    respond_to do |format|
      if @foto.save
        format.html { redirect_to @foto, notice: 'Foto was successfully created.' }
        format.json { render :show, status: :created, location: @foto }
      else
        format.html { render :new }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /fotos/1
  # PATCH/PUT /fotos/1.json
  def update
    respond_to do |format|
      if @foto.update(foto_params)
        format.html { redirect_to @foto, notice: 'Foto was successfully updated.' }
        format.json { render :show, status: :ok, location: @foto }
      else
        format.html { render :edit }
        format.json { render json: @foto.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @foto.destroy
    respond_to do |format|
      format.html { redirect_to fotos_url, notice: 'Foto was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    def set_foto
      @foto = Foto.find(params[:id])
    end

    def foto_params
      params.require(:foto).permit(:description, :image)
    end

    def correct_user
      @foto = current_user.fotos.find_by(id: params[:id])
      redirect_to fotos_path, notice: "Nie jesteś uprawniony do edycji tego zdjęcia" if @photo.nil?
      end
end
