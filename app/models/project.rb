class Project < ActiveRecord::Base

	belongs_to :client

	has_many :tasks
	
	has_many :project_categories
	has_many :categories, through: :project_categories
	belongs_to :user

validates_presence_of :name,:description,:status


#when arguments are passed for a method we use : before, and for options for
#method we pass :after, the values for the otions we pass : before

validates_length_of :description,minimum:10
validates_uniqueness_of :name



validate :check_start_date

validate :check_name


def completed_tasks

self.tasks.where('is_completed = ?',true)
end

def incompleted_tasks

	self.tasks.where('is_completed = ?',false)
end

def overdue_tasks

	self.tasks.where('is_completed = ? AND due_date <?',false,Date.today)

end

end

private


def check_start_date

	if !(self.start_date.nil?)&& self.start_date >= Date.today+7.days
		errrors.add(:start_date,"start_date error")
	end
end

def check_name

	if self.name == nil && Project.where('name ?',self.name) == nil
		errors.add(:name, "name error")

	end


end

