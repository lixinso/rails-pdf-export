class Pdf2sController < ApplicationController
  # GET /pdf2s
  # GET /pdf2s.xml
  def index
    @pdf2s = Pdf2.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @pdf2s }
    end
  end

  # GET /pdf2s/1
  # GET /pdf2s/1.xml
  def show
    @pdf2 = Pdf2.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @pdf2 }
    end
  end

  # GET /pdf2s/new
  # GET /pdf2s/new.xml
  def new
    @pdf2 = Pdf2.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @pdf2 }
    end
  end

  # GET /pdf2s/1/edit
  def edit
    @pdf2 = Pdf2.find(params[:id])
  end

  # POST /pdf2s
  # POST /pdf2s.xml
  def create
    @pdf2 = Pdf2.new(params[:pdf2])

    respond_to do |format|
      if @pdf2.save
        format.html { redirect_to(@pdf2, :notice => 'Pdf2 was successfully created.') }
        format.xml  { render :xml => @pdf2, :status => :created, :location => @pdf2 }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @pdf2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pdf2s/1
  # PUT /pdf2s/1.xml
  def update
    @pdf2 = Pdf2.find(params[:id])

    respond_to do |format|
      if @pdf2.update_attributes(params[:pdf2])
        format.html { redirect_to(@pdf2, :notice => 'Pdf2 was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @pdf2.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pdf2s/1
  # DELETE /pdf2s/1.xml
  def destroy
    @pdf2 = Pdf2.find(params[:id])
    @pdf2.destroy

    respond_to do |format|
      format.html { redirect_to(pdf2s_url) }
      format.xml  { head :ok }
    end
  end
end
