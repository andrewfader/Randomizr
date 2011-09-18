class RandomizersController < InheritedResources::Base
  respond_to :html
  layout 'application'
  actions :all

  before_filter do
    @randomizer = Randomizer.find_by_id(params[:id])
  end

  def create
    create! { "/" }
  end

  def destroy
    destroy! { "/" }
  end

  def jumpers_sort
    @randomizer.jumpers.each do |jumper|
      jumper.position = params['li_jumper'].index(jumper.id.to_s) + 1
      jumper.save
    end
    head :ok
  end

end
