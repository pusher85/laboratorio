class Clienti < ActiveRecord::Base
	has_many :interventis, :dependent => :destroy, :foreign_key => "cliente_id"
	#has_many :interventis, :through => :cliente_id
	has_many :comunicazionis, :through => :interventis
	
	validates :nome, presence: true, length: {minimum: 5 }
	validates :telefono, presence: true, length: {minimum: 9}, numericality: true
end
