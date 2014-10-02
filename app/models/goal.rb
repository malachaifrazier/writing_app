class Goal < ActiveRecord::Base
	has_many :entries
	belongs_to :projects
	belongs_to :goal_type

	def type_is
		if goal_type
			goal_type = GoalType.find_by id: goal_type_id
			goal_type.name
		end
	end

	def project_name
		
			project = Project.find_by id: project_id
			project.name
		
	end
end
