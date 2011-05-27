class ResolutionReportsController < ApplicationController
  # GET /resolution_reports
  # GET /resolution_reports.xml
  def index
    @resolution_reports = ResolutionReport.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @resolution_reports }
    end
  end

  # GET /resolution_reports/1
  # GET /resolution_reports/1.xml
  def show
    @resolution_report = ResolutionReport.find(params[:id])

    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @resolution_report }
    #   format.pdf do
    #       render :pdf => "file_name"
    #   end
    # end
    
     respond_to do |format|
        format.html
        format.pdf do
          render :pdf => "file_name",
          :header => { :right => '[page] of [topage]' }
        end
      end
    
    
    
    
  end

  # GET /resolution_reports/new
  # GET /resolution_reports/new.xml
  def new
    @resolution_report = ResolutionReport.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @resolution_report }
    end
  end

  # GET /resolution_reports/1/edit
  def edit
    @resolution_report = ResolutionReport.find(params[:id])
  end

  # POST /resolution_reports
  # POST /resolution_reports.xml
  def create
    @resolution_report = ResolutionReport.new(params[:resolution_report])

    respond_to do |format|
      if @resolution_report.save
        format.html { redirect_to(@resolution_report, :notice => 'ResolutionReport was successfully created.') }
        format.xml  { render :xml => @resolution_report, :status => :created, :location => @resolution_report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @resolution_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /resolution_reports/1
  # PUT /resolution_reports/1.xml
  def update
    @resolution_report = ResolutionReport.find(params[:id])

    respond_to do |format|
      if @resolution_report.update_attributes(params[:resolution_report])
        format.html { redirect_to(@resolution_report, :notice => 'ResolutionReport was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @resolution_report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /resolution_reports/1
  # DELETE /resolution_reports/1.xml
  def destroy
    @resolution_report = ResolutionReport.find(params[:id])
    @resolution_report.destroy

    respond_to do |format|
      format.html { redirect_to(resolution_reports_url) }
      format.xml  { head :ok }
    end
  end
end
