= prohax

* http://github.com/nkpart/prohax

== What?

Just some hax that I use.

== Contents

* Let-in - a neat syntax that's a bit like haskell. Contents of the hash supplied to `let()`
  are defined as functions on a container, on which the block passed to `in` is instance_eval'd with.

 let( :awesome => proc { |n| "#{n} is awesome." }).in { [1,2,3].map { |e|  awesome(e) }
 
 It can also be used to create mini dsl things like this:
 
 def add a
   let(:to => proc { |b| b + a })
 end

 add(5).to(3) # <= 8  

* Strucked - a class builder, that just instantiates instance vars
  
  # before
  class Foo
    def initialize a, b
      @a = a
      @b = b
    end
  end
  
  # after
  class Foo < Strucked.build(:a, :b)
  end
  
  # with readers
  class Foo < Strucked.build(:a, :b).with_readers
  end
  
  Foo.new(5, 10).a # <= 5
  
* Kernel#either - a kind of either-like thing.

  # If no exceptions are thrown, `failure` will be nil and `success` will be the result of the block.
  # Otherwise, success will be nil and failure will hold the exception
  success, failure = either {
    raise "fail"
  }
  failure # <= RuntimeError('fail')
  
  success, failure = either { 5 }
  success # <= 5
  


== SYNOPSIS:

  FIX (code sample of usage)

== LICENSE:

(The MIT License)

Copyright (c) 2008 FIXME full name

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.