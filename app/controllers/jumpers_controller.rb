class JumpersController < InheritedResources::Base
  respond_to :html, :xml, :json
  actions :all

  before_filter :find_jumper, :except => :create

  def create
    create! do |format|
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
          head :no_content
        else
          redirect_to @randomizer
        end
      end
    end
  end

  private

  def find_jumper
    @jumper = Jumper.find(params[:id])
    @randomizer = @jumper.randomizer || Randomizer.find_by_id(params[:randomizer_id])
  end

end
