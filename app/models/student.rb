class Student < ActiveRecord::Base
has_many :classes
has_many :instructors, :through => :classes


end
