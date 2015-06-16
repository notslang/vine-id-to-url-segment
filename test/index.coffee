should = require 'should'
{vineIdToUrlSegment, urlSegmentToVineId} = require '../lib'
samples = require './samples.json'

describe 'vine-id-to-url-segment', ->
  it 'should convert ids to URL segments', ->
    for [id, urlSegment] in samples
      vineIdToUrlSegment(id).should.equal(urlSegment)

  it 'should convert URL segments to ids', ->
    for [id, urlSegment] in samples
      urlSegmentToVineId(urlSegment).should.equal(id)
