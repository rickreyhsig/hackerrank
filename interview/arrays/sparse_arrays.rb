# https://www.hackerrank.com/challenges/sparse-arrays/problem?utm_campaign=challenge-recommendation&utm_medium=email&utm_source=24-hour-campaign

# Complete the matchingStrings function below.
def matchingStrings(strings, queries)
    matchingStrings = Array.new
    queries.each do |query|
        matchingStrings << strings.count(query)
    end
    return matchingStrings
end

matchingStrings(['aba', 'baba', 'aba','xzxb'], ['aba', 'xzxb', 'ab'])
matchingStrings(['def', 'de', 'fgh'], ['de', 'lmn', 'fgh'])
matchingStrings(['abcde', 'sdaklfj', 'asdjf', 'na', 'basdn', 'sdaklfj', 'asdjf',
                 'na', 'asdjf', 'na', 'basdn', 'sdaklfj', 'asdjf'], ['abcde',
                 'sdaklfj', 'asdjf', 'na', 'basdn'])
