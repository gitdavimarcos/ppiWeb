class NotasController < ApplicationController
  before_action :set_nota, only: [:show, :edit, :update, :destroy]

  # GET /notas
  # GET /notas.json
  def index
    @notas = Nota.all
  end

  # GET /notas/1
  # GET /notas/1.json
  def show
  end

  # GET /notas/new
  def new
    @nota = Nota.new
  end

  # GET /notas/1/edit
  def edit
  end

  # POST /notas
  # POST /notas.json
  def create
    @nota = Nota.new(nota_params)

    respond_to do |format|
      if @nota.save
        format.html { redirect_to @nota, notice: 'Nota was successfully created.' }
        format.json { render :show, status: :created, location: @nota }
      else
        format.html { render :new }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notas/1
  # PATCH/PUT /notas/1.json
  def update
    respond_to do |format|
      if @nota.update(nota_params)
        format.html { redirect_to @nota, notice: 'Nota was successfully updated.' }
        format.json { render :show, status: :ok, location: @nota }
      else
        format.html { render :edit }
        format.json { render json: @nota.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notas/1
  # DELETE /notas/1.json
  def destroy
    @nota.destroy
    respond_to do |format|
      format.html { redirect_to notas_url, notice: 'Nota was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_nota
      @nota = Nota.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nota_params
      params.require(:nota).permit(:inscricao_id, :curso_id, :nota, :frequencia)
    end
end
