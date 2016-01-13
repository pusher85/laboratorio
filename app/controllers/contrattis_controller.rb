class ContrattisController < ApplicationController
  before_action :set_contratti, only: [:show, :edit, :update, :destroy]

  # GET /contrattis
  # GET /contrattis.json
  def index
    @clienti = Clienti.find(params[:clienti_id])
    #@contrattis = Contratti.all
    #@contrattis = Contratti.where(cliente_id: params[:clienti_id])
    #clienti_id
    @contrattis = Contratti.where(@clienti_id)

  end

  # GET /contrattis/1
  # GET /contrattis/1.json
  def show
  end

  # GET /contrattis/new
  def new
    @clienti = Clienti.find(params[:clienti_id])
    @contratti = Contratti.new
  end

  # GET /contrattis/1/edit
  def edit
     @clienti = Clienti.find(params[:clienti_id])
  end

  # POST /contrattis
  # POST /contrattis.json
  def create
    @clienti = Clienti.find(params[:clienti_id])
    @contratti = Contratti.new(contratti_params)

    respond_to do |format|
      if @contratti.save
        #format.html { redirect_to @contratti, notice: 'Contratti was successfully created.' }
        format.html { redirect_to clienti_contrattis_path(@clienti), notice: 'Contratti was successfully created.' }
        format.json { render :show, status: :created, location: @contratti }
      else
        format.html { render :new }
        format.json { render json: @contratti.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contrattis/1
  # PATCH/PUT /contrattis/1.json
  def update
    @clienti = Clienti.find(params[:clienti_id])
    respond_to do |format|
      if @contratti.update(contratti_params)
        format.html { redirect_to clienti_contrattis_path(:clienti_id => @clienti), notice: 'Contratti was successfully updated.' }
        format.json { render :show, status: :ok, location: @contratti }
      else
        format.html { render :edit }
        format.json { render json: @contratti.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contrattis/1
  # DELETE /contrattis/1.json
  def destroy
    @contratti.destroy
    respond_to do |format|
      format.html { redirect_to clienti_contrattis_path, notice: 'Contratti was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contratti
      @contratti = Contratti.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contratti_params
      params.require(:contratti).permit(:clienti_id, :acquisto, :ore, :note)
    end
end