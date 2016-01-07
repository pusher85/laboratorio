class InterventiController < ApplicationController

	#per ispezionare i valori passati in POST
	#render plain: params[:intervento].inspect
	
	def index
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.where(cliente_id: params[:clienti_id]).order("data DESC")
		#@esitosms = 
	end


	def show
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:id])
	end


	def new
		@interventi = Interventi.new
		@clienti = Clienti.find(params[:clienti_id])	
		#@clienti = Clienti.find(params[:id])
	end


	def edit
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:id])
	end


	def create
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.new(parametri_intervento)
		if @interventi.save
			redirect_to clienti_interventi_path(:id => @interventi)
		else
			render 'new'
		end
	end


	def update
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:id])
		if @interventi.update(parametri_intervento)
	    redirect_to clienti_interventi_path(:id => @interventi)
	  else
	    render 'edit'
	  end
	end


	def destroy
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:id])
		@interventi.destroy
		redirect_to clienti_interventi_index_path(params[:clienti_id])
	end

	def sms
		@clienti = Clienti.find(params[:clienti_id])
		@interventi = Interventi.find(params[:interventi_id])
		@sms = Skuby::Gateway.send_sms('Messaggio di prova', '393291529641')
		if @sms.success? #=> true
			redirect_to clienti_interventi_index_path
			#redirect_to clienti_interventi_index_path(:esitosms => @sms.success)
		end
	end

	
	private
		def parametri_intervento
			params.require(:interventi).permit(:cliente_id, :data, :apparecchiatura, :intervento, :durata, :note, :chiuso)
		end
		

end
