class PdftestController < ApplicationController
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
      format.pdf  { render :layout => false }
    end
    
  end

end
