class Subject < ActiveRecord::Base
	has_many :pages
	has_many :assignments
	belongs_to :user
	scope :visible, -> { where(visible: true) }
  	scope :invisible, -> { where(visible: false) }
    scope :search,  lambda{|query| where(["name LIKE ?", "%#{query}%"])}
    attr_accessible :name, :visible, :pages, :semester
end
