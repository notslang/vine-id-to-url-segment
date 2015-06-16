BigNumber = require 'bignumber.js'
map = require './charmap.json'

reversedMap = {}
for i, o of map
  reversedMap[o] = i

vineIdToUrlSegment = (id) ->
  id = (new BigNumber(id)).toString(49)
  urlSegment = ''
  for char in id
    urlSegment += map[char]
  return urlSegment

urlSegmentToVineId = (urlSegment) ->
  id = ''
  for char in urlSegment
    id += reversedMap[char]
  id = (new BigNumber(id, 49)).toString(10)
  return id

module.exports = {vineIdToUrlSegment, urlSegmentToVineId}
