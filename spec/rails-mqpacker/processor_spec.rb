require 'spec_helper'

describe RailsMqpacker::Processor do
  let(:sample_css) do
    <<-END
      #header { font-size: 2em; }

      @media (max-width: 768px) {
        #header { font-size: 1em; }
      }

      #footer { width: 80%; }

      @media (max-width: 768px) {
        #footer { width: auto; }
      }
    END
  end

  subject { described_class.process(sample_css) }

  it 'packs media queries into one' do
    expect(subject).to eq <<-END
      #header { font-size: 2em; }

      #footer { width: 80%; }

      @media (max-width: 768px) {
        #header { font-size: 1em; }

        #footer { width: auto; }
      }
    END
  end
end
