require './spec/support/spec_helper.rb'
require './app/move'

describe "move" do
  subject { move(request) }
  let(:request) { create_move_request({ you: { 
        head: { 
          x: 5,          
          y: 6 }
        }
      }) }

  it "moves up" do
    is_expected.to eq({move: "up", shout: "I'm at 5, 6!"})
  end

  context "when Hettie is about to run into a wall" do
    let(:request) do 
      create_move_request({ you: { 
        head: { 
          x: 5,          
          y: 10 }
        }
      })
    end

    it "moves left" do
      is_expected.to eq({move: "left", shout: "I'm at 5, 10!"})
    end
  end

  context "when Hettie is about to run into a wall" do
    let(:request) do
      create_move_request({ you: {
        head: {
          x: 0,
          y: 10 }
        }
      })
    end

    it "moves left" do
      is_expected.to eq({move: "down", shout: "I'm at 0, 10!"})
    end
  end
end
