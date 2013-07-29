class Talk < ActiveRecord::Base
  has_many :attendances
  has_many :attendees, :through => :attendances

  attr_accessible :description, :room, :speaker, :title

  validates :title, :presence => true
  validates :room, :presence => true
  validates :speaker, :presence => true
end
