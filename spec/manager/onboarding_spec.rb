# frozen_string_literal: true

require 'spec_helper'

describe 'Onboarding check', :onboarding, :smoke do
  it 'Check the presence of content on each page' do
    pages_count = 5

    pages_count.times do
      expect(Onboarding.title_text_value != '').to be_truthy
      expect(Onboarding.description_text != '').to be_truthy
      expect(Onboarding.example_image?).to be_truthy
      Onboarding.next_button_click
    end
  end
end
