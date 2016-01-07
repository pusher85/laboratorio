class ClientiController < ApplicationController
	
	def index
		@clienti = Clienti.all
	end

	def show
		@clienti = Clienti.find(params[:id])
	end

	def new
		@clienti = Clienti.new
	end

	def edit
		@clienti = Clienti.find(params[:id])
	end

	def create
		@clienti = Clienti.new(clienti_params)
		if @clienti.save
			redirect_to @clienti
		else
			render 'new'
		end
	end

	def update
	  @clienti = Clienti.find(params[:id])
	 
	  if @clienti.update(clienti_params)
	    redirect_to @clienti
	  else
	    render 'edit'
	  end
	end

	def destroy
		@clienti = Clienti.find(params[:id])
	  	@clienti.destroy
	   	#redirect_to clienti_path
	   	redirect_to clienti_index_path
	end

	private
		def clienti_params
			params.require(:clienti).permit(:nome, :piva, :codfisc, :email, :telefono, :note)
		end

end
