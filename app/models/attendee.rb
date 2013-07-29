class Attendee < ActiveRecord::Base
  has_many :attendances
  has_many :talks, :through => :attendances

  attr_accessible :affiliation, :email, :name

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true
end
