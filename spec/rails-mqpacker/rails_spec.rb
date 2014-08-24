require 'spec_helper'

describe CssController, type: :controller do
  subject { response }

  before do
    cache = Rails.root.join('tmp/cache')
    cache.rmtree if cache.exist?

    get :test
  end

  it { is_expected.to be_success }

  it 'packs similar media queries' do
    expect(subject.body).to eq <<-END
body {
  font-size: 16px; }

.footer {
  line-height: 2em; }
  @media (max-width: 480px) {
    body {
      font-size: 14px; }

    .footer {
      display: none; } }
    END
  end
end
