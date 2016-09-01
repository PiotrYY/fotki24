class FotosController < ApplicationController
  before_action :set_foto, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:edit, :new, :create, :destroy, :update]
  before_action :check_user, only: [:edit, :destroy, :update]

  def index
    @fotos = Foto.all.order("created_at DESC")
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
        format.html { redirect_to @foto, notice: 'Zdjęcie skutecznie dodane !' }
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
        format.html { redirect_to @foto, notice: 'Zdjęcie zmienione !' }
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
      format.html { redirect_to fotos_url, notice: 'Zdjęcie skutecznie usunięte !' }
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


    private
      def check_user
        foto = Foto.find(params[:id])
        if current_user == foto.user
          true
        else
          redirect_to foto_path(foto)
        end
      end
      # Use callbacks to share common setup or constraints between actions.
      def set_foto
        @foto = Foto.find(params[:id])
      end
end
