class Event < ApplicationRecord
  #validates_presence_of :name
  has_many :attendees
  has_many :event_groupships
  has_many :groups, :through => :event_groupships
  has_one :location
  accepts_nested_attributes_for :location, :allow_destroy => true, :reject_if => :all_blank
  belongs_to :category
end
