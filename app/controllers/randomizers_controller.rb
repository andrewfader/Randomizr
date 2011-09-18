class RandomizersController < InheritedResources::Base
  respond_to :html, :json
  layout 'application'
  actions :all

  before_filter do
    @randomizer = Randomizer.find_by_id(params[:id])
  end

  def create
    create! { @randomizer }
  end

  def destroy
    destroy! { "/" }
  end

  def jumpers_sort
    @randomizer.jumpers.each do |jumper|
      jumper.position = params['jumper'].index(jumper.id.to_s) + 1
      jumper.save!
    end
    head :ok
  end

  def show
    show! do |format|
      format.html
      format.json do
        render :partial => "randomizers/show.json"
      end
    end
  end
end
