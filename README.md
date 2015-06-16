# Vine Id To URL Segment
[![Build Status](http://img.shields.io/travis/slang800/vine-id-to-url-segment.svg?style=flat-square)](https://travis-ci.org/slang800/vine-id-to-url-segment) [![NPM version](http://img.shields.io/npm/v/vine-id-to-url-segment.svg?style=flat-square)](https://www.npmjs.org/package/vine-id-to-url-segment) [![NPM license](http://img.shields.io/npm/l/vine-id-to-url-segment.svg?style=flat-square)](https://www.npmjs.org/package/vine-id-to-url-segment)

[Vine.co](https://en.wikipedia.org/wiki/Vine_%28service%29) has 2 types of IDs that they use for their videos. One is used in the URLs (it looks like `bvlaYggdIiU`) and the other is used internally in their undocumented API (it looks like `913509459945467904`). I didn't think that they would maintain 2 unrelated IDs for each post, just for the purpose of a shorter URL, so I investigated whether or not they were related. It turns out they are and you can convert between them pretty easily (especially in languages where we don't represent integers as floats - like Python).

So, this package is what I came up with for converting the video ID into the segment of their "permalinks" that represents the video. It's probably worth noting that this is not a standard conversion. It lacks the elegance of base 62, and doesn't seem to avoid characters for any particular reason (like removing the O/0 and L/I pairs). The 1st step is using base 49, and the 2nd step involves mapping characters to counterparts that I discovered experimentally. As far as I can tell, these mappings are random, but perhaps someone with more time could look into it further... I have a hard time believing that a programmer would apply a character mapping if it was totally useless &/or arbitrary.

## Usage
Note: the id must be passed in as a string. If it was passed as a number then it would be severely rounded.

### CoffeeScript
```coffee
{vineIdToUrlSegment, urlSegmentToVineId} = require 'vine-id-to-url-segment'
console.log(vineIdToUrlSegment('913509459945467904')) # bvlaYggdIiU
console.log(urlSegmentToVineId('bvlaYggdIiU')) # 913509459945467904
```

### JavaScript
```js
var ref, urlSegmentToVineId, vineIdToUrlSegment;
ref = require('vine-id-to-url-segment')
vineIdToUrlSegment = ref.vineIdToUrlSegment
urlSegmentToVineId = ref.urlSegmentToVineId;

console.log(vineIdToUrlSegment('913509459945467904')); // bvlaYggdIiU
console.log(urlSegmentToVineId('bvlaYggdIiU')); // 913509459945467904
```
