require 'rails_helper'

describe PropublicaService do
  context "instance methods" do
    context "#members_by_state" do
      it "returns member data" do
        service = PropublicaService.new
        search = service.members_of_house("CO")
        expect(search).to be_a Hash
        expect(search[:results]).to be_an Array
        member_data = search[:results].first

        expect(member_data).to have_key :name
        expect(member_data).to have_key :role
        expect(member_data).to have_key :district
        expect(member_data).to have_key :party
      end
    end
  end
end