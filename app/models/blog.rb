class Blog < ActiveRecord::Base
	#validacones
	validates :siteTitle, presence: { message: "ups requerido!"}
	validates :siteDescription, presence: { message: "ups requerido!"}
    validates :siteHeader, presence: { message: "ups requerido!"}


	belongs_to :user
	has_many :posts

	 belongs_to :category
	 
	 scope :sorted, -> {order('id desc')}

end
