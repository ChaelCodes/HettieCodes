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
    is_expected.to eq({move: "up", shout: "Let's move up!"})
  end

  context "when Hettie is about to run into a wall" do
    let(:request) do 
      create_move_request({ you: { 
        head: { 
          x: 5,          
          y: 0 }
        }
      })
    end

    it "moves left" do
      is_expected.to eq({move: "left", shout: "Let's move left!"})
    end
  end
end
