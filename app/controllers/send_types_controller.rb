class SendTypesController < ApplicationController
  def index
    @send_type = SendType.all
  end

  def new
    @send_type = SendType.new
  end

  def edit
  end

  def create
    @send_type = SendType.new(send_type_params)

    respond_to do |format|
      if @send_type.save
        format.html { redirect_to @send_type, notice: "Тип посылок успешно задан." }
        format.json { render :show, status: :created, location: @send_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @send_type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_send_type
      @send_type = SendType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def send_type_params
      params.require(:send_type).permit(:info)
    end
end
