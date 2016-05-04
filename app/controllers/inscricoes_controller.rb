class InscricoesController < ApplicationController
  before_action :set_inscricao, only: [:show, :edit, :update, :destroy]

  # GET /inscricoes
  # GET /inscricoes.json
  def index
    @inscricoes = Inscricao.all
  end

  # GET /inscricoes/1
  # GET /inscricoes/1.json
  def show
  end

  # GET /inscricoes/new
  def new
    @inscricao = Inscricao.new
  end

  # GET /inscricoes/1/edit
  def edit
  end

  # POST /inscricoes
  # POST /inscricoes.json
  def create
    @inscricao = Inscricao.new(inscricao_params)

    respond_to do |format|
      if @inscricao.save
        format.html { redirect_to @inscricao, notice: 'Inscricao was successfully created.' }
        format.json { render :show, status: :created, location: @inscricao }
      else
        format.html { render :new }
        format.json { render json: @inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inscricoes/1
  # PATCH/PUT /inscricoes/1.json
  def update
    respond_to do |format|
      if @inscricao.update(inscricao_params)
        format.html { redirect_to @inscricao, notice: 'Inscricao was successfully updated.' }
        format.json { render :show, status: :ok, location: @inscricao }
      else
        format.html { render :edit }
        format.json { render json: @inscricao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inscricoes/1
  # DELETE /inscricoes/1.json
  def destroy
    @inscricao.destroy
    respond_to do |format|
      format.html { redirect_to inscricoes_url, notice: 'Inscricao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inscricao
      @inscricao = Inscricao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inscricao_params
      params.require(:inscricao).permit(:nome, :endereco, :telefone, :cidade, :curso_id)
    end
end
