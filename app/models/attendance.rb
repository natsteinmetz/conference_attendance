class Attendance < ActiveRecord::Base
  belongs_to :attendee
  belongs_to :talk

  attr_accessible :presenter, :talk_id, :attendee_id

  validates :attendee, :presence => true
  validates :talk, :presence => true
end
