class Blog < ActiveRecord::Base

	#callbacks
	after_create :update_slug
	before_update :assign_slug
 

	#validacones
	validates :siteTitle, presence: { message: "ups requerido!"}
	validates :siteDescription, presence: { message: "ups requerido!"}
    validates :siteHeader, presence: { message: "ups requerido!"}
     
    #asociaciones
	belongs_to :user
	has_many :posts
	belongs_to :category
	
	#scope para ordenar registros de manera descendente por ID
	scope :sorted, -> {order('id desc')}
   	
   	def to_param
    	slug
  	end


	 private

		def assign_slug
		self.slug = "#{ siteTitle.parameterize }"
	 	end

		def update_slug
		update_attributes slug: assign_slug
		end

end
