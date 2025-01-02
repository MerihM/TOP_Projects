require './lib/board'

describe Board do
   describe '#add_token' do
    let(:test_arr) {Array.new(6){Array.new(7){'i'}}}
        it "add token to the position in the board" do
            test_arr[5][4] = 'x'
            board = Board.new
            expect(board.add_token('x', 4)).to eql(test_arr)
        end
        it "add tokens to the positions in the board" do
            test_arr[5][4] = 'x'
            board = Board.new
            expect(board.add_token('x', 4)).to eql(test_arr)
            test_arr[4][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
        end
        it "expect error message for full column" do
            test_arr[5][4] = 'x'
            board = Board.new
            expect(board.add_token('x', 4)).to eql(test_arr)
            test_arr[4][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
            test_arr[3][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
            test_arr[2][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
            test_arr[1][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
            test_arr[0][4] = 'o'
            expect(board.add_token('o', 4)).to eql(test_arr)
            expect(board.add_token('x', 4)).to eql("That column is full!!!")
        end
   end 
end