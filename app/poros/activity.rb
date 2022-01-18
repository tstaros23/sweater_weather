class Activity

  attr_reader :title, :type, :participants, :price, :activity, :id
  def initialize(attr)
    @title = attr[:activity]
    @type = attr[:type]
    @participants = attr[:participants]
    @price = attr[:price]
  end
end
