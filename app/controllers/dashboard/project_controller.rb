class Dashboard::ProjectController < Dashboard::DashboardController
  
  def index
    @projects = Project.all
  end
  
  def show
    @project = Project.find(params[:id])
  end
  
  def new
    @project = Project.new
  end
  
  def create
      @project = Project.new(project_params)
      if @project.save
        redirect_to dashboard_root_path,  notice: "Your project was created successfully"
      else
        render "new"
      end
  end
  
  def show
    @project = Project.find(params[:id])
    @project_technos = format_technos(@project)
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def edit
    @project = Project.find(params[:id])
    if @project.update_attributes(project_params)
      redirect_to dashboard_root_path,  notice: "Your project was modified successfully"
    else
      render 'edit'
    end
  end
  
  def destroy
    Project.find(params[:id]).destroy
    redirect_to dashboard_root_path,  notice: "Your project was deleted successfully"
  end

  protected
  def project_params
    params.require(:project).permit(:name, :project_duration, :description, :technos, :screenshots)
  end
  
  def format_technos(project)
    arr = []
    project.technos.split(' ').each do|c|
      arr << c
    end
  end
  
end