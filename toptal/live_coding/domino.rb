# https://sharetask.io/t/0uFKEl-hQluEChQ_c22o_
# Subsequent Dominoes


def longest_matching_domino(s)
    matching = 1
    matching_max = 1
    tiles = s.split(',')
    tiles.each_with_index do |tile, index|
        break if index == tiles.length-1
        if tile.split('-')[1] == tiles[index+1].split('-')[0]
            matching += 1
        else
            matching_max = matching
            matching = 1
        end
    end
    matching_max
    # Return length of matching tiles
    # If 0, no macthing tiles were chained
    return matching > matching_max ? matching : matching_max
end

#p longest_matching_domino("6-3")
#p longest_matching_domino("4-3,5-1,2-2,1-3,4-4")
#p longest_matching_domino("1-1,3-5,5-2,2-3,2-4")
#p longest_matching_domino("1-1,1-5,5-2,2-3,3-4")

p longest_matching_domino("1-1")
p longest_matching_domino("1-2,1-2")
p longest_matching_domino("3-2,2-1,1-4,4-4,5-4,4-2,2-1")
p longest_matching_domino("5-5,5-5,4-4,5-5,5-5,5-5,5-5,5-5,5-5,5-5")
p longest_matching_domino("1-1,3-5,5-5,5-4,4-2,1-3")
p longest_matching_domino("1-2,2-2,3-3,3-4,4-5,1-1,1-2")
