class JumpersController < InheritedResources::Base
  respond_to :html, :xml, :json

  before_filter do
    @jumper = Jumper.find_by_id(params[:id])
  end

  def create
    create! do |format|
      @jumper.move_to_top
      format.html do
        if request.xhr?
          @jumper.save!
          render :partial => "jumpers/jumper", :locals => {:jumper => @jumper}
        else
          redirect_to @randomizer
        end
      end
    end
  end

  def update
    update! do |format|
      format.html do
        if request.xhr?
          render :partial => "jumpers/jumper", :locals => {:jumper => @jumper}
        else
          redirect_to @randomizer
        end
      end
    end
  end

  def destroy
    destroy! do |format|
      format.html do
        if request.xhr?
          head :ok
        else
          redirect_to @randomizer
        end
      end
    end
  end
end
