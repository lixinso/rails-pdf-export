class Pdf3sController < ApplicationController
  # GET /pdf3s
  # GET /pdf3s.xml
  def index
    @pdf3s = Pdf3.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pdf3s }
    end
  end

  # GET /pdf3s/1
  # GET /pdf3s/1.xml
  def show
    @pdf3 = Pdf3.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pdf3 }
      format.pdf  { render :layout => false }
    end
  end

  # GET /pdf3s/new
  # GET /pdf3s/new.xml
  def new
    @pdf3 = Pdf3.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pdf3 }
    end
  end

  # GET /pdf3s/1/edit
  def edit
    @pdf3 = Pdf3.find(params[:id])
  end

  # POST /pdf3s
  # POST /pdf3s.xml
  def create
    @pdf3 = Pdf3.new(params[:pdf3])

    respond_to do |format|
      if @pdf3.save
        format.html { redirect_to(@pdf3, :notice => 'Pdf3 was successfully created.') }
        format.xml  { render :xml => @pdf3, :status => :created, :location => @pdf3 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pdf3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pdf3s/1
  # PUT /pdf3s/1.xml
  def update
    @pdf3 = Pdf3.find(params[:id])

    respond_to do |format|
      if @pdf3.update_attributes(params[:pdf3])
        format.html { redirect_to(@pdf3, :notice => 'Pdf3 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pdf3.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf3s/1
  # DELETE /pdf3s/1.xml
  def destroy
    @pdf3 = Pdf3.find(params[:id])
    @pdf3.destroy

    respond_to do |format|
      format.html { redirect_to(pdf3s_url) }
      format.xml  { head :ok }
    end
  end
end
