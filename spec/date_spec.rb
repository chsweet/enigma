require 'spec_helper'
require './lib/date'

RSpec.describe Date do

  it 'creates todays date DDMMYY' do
    expect(Date.todays_date).to eq("120621")
    expect(Date.todays_date.length).to eq(6)
    expect(Date.todays_date.class).to eq(String)

  end
end
