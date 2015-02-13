class Post < ActiveRecord::Base
	belongs_to :blog
	has_many :comments

	validates :entryTitle, presence: { message: "ups requerido!"}
    validates :entryContent, presence: { message: "ups requerido!"}


	scope :sorted, -> {order('id desc')}

end
