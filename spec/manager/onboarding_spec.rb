# frozen_string_literal: true

require 'spec_helper'

pages_count = 5

describe Onboarding, :onboarding, :smoke do
  1.upto(pages_count) do |page_number|
    it "Check page ##{page_number} title" do
      expect(described_class.title_text_value != '').to be_truthy
    end

    it "Check page ##{page_number} description" do
      expect(described_class.description_text != '').to be_truthy
    end

    it 'Click on the Next button' do
      described_class.next_button_click
    end
  end
end
