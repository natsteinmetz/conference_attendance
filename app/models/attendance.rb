class Attendance < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :talk

  attr_accessible :presenter

  validates :attendee, :presence => true
  validates :talk, :presence => true
  validates :presenter, :presence => true
end
