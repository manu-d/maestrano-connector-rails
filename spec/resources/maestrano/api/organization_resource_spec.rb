# frozen_string_literal: true
require 'spec_helper'

RSpec.describe Maestrano::Api::OrganizationResource, type: :resource do
  let(:organization) { create(:organization) }
  subject { described_class.new(organization, {}) }
  before { allow(Maestrano::Connector::Rails::External).to receive(:create_account_link).and_return('www.maestrano.com') }

  # == Attributes ===========================================================
  it { is_expected.to have_attribute :has_account_linked }
  it { is_expected.to have_attribute :name }
  it { is_expected.to have_attribute :uid }
  it { is_expected.to have_attribute :org_uid }

  # == Filters ==============================================================
  it { is_expected.to filter(:uid) }
end
