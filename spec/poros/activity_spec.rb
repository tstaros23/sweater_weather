require 'rails_helper'

 RSpec.describe Activity do
   it "builds appropriate activities" do
     attr = {
       activity: "Go see a Broadway production",
       type: 'recreational',
       participants: 4,
       price: 0
     }

   activity = Activity.new(attr)

   expect(activity).to be_an_instance_of(Activity)
   expect(activity.title).to eq("Go see a Broadway production")
   expect(activity.type).to eq('recreational')
   expect(activity.participants).to eq(4)
   expect(activity.price).to eq(0)
   end
 end
