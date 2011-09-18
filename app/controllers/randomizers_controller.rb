class RandomizersController < InheritedResources::Base
  respond_to :html
  layout 'application'
  actions :all

  def create
    create! { "/" }
  end
  def destroy
    destroy! { "/" }
  end
end
