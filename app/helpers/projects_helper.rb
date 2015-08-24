module ProjectsHelper
    
    def count_projects
        Project.all.count
    end
    
end
