class ComunicazioniController < ApplicationController
	def index
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:interventi_id])
	end


	def show
	end


	def new
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:interventi_id])
	end


	def edit
	end


	def create
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:interventi_id])
		@comunicazioni = Comunicazioni.new(parametri_comunicazioni)
		if @comunicazioni.save
			redirect_to clienti_interventi_path(:id => @interventi)
		else
			render 'new'
		end
	end


	def update
	end


	def destroy
	end



	private
		def parametri_comunicazioni
			params.require(:comunicazioni).permit(:interventi_id, :tipo, :destinatario, :testo)
		end






end
