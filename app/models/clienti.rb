class Clienti < ActiveRecord::Base
	has_many :interventis
	#has_many :interventis, :through => :cliente_id
	
	validates :nome, presence: true, length: {minimum: 5 }
	validates :telefono, presence: true, length: {minimum: 9}
end
