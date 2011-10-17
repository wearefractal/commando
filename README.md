```                                                        
                                                            _       
                                                           | |      
               ___ ___  _ __ ___  _ __ ___   __ _ _ __   __| | ___  
      O       / __/ _ \| '_ ` _ \| '_ ` _ \ / _` | '_ \ / _` |/ _ \ 
  ---=/\>    | (_| (_) | | | | | | | | | | | (_| | | | | (_| | (_) |
       /\/    \___\___/|_| |_| |_|_| |_| |_|\__,_|_| |_|\__,_|\___/    
       \

```
### Installation

To install `commando` use [npm](http://github.com/isaacs/npm):

    $ npm install -g commando

### Usage

To create a new `commando` app:

    $ commando create appName

`commando` scaffolds out your app, creating & auto-populating package.json, README.MD etc. 
based on [npm-boilerplate](https://github.com/wearefractal/npm-boilerplate) but takes it a step further by 
auto-populating your package.json and docs with your app name and git user info.

Simply create your commands in `appName/commands` and `npm publish` from the root of `appName/` to publish your cli app to npm

### Structure

A `commando` app consists of **commands** - single files or folders that contain sub-commands 

    appName/
    
      commands/     # contains commands
        help.coffee # here by default
     
      lib/          # contains commando-specific files
      
      CHANGELOG.md
      LICENSE       # MIT by default
      README.md     # generated based on git & app info
      sig           # the sig or heading of your app (usually ascii art)
      TODO.md
      package.json  # generated based on git & app info


### Resources

[ascii art text generator](http://www.network-science.de/ascii/) for your sig

### LICENSE

(MIT License)

Copyright (c) 2011 Fractal <contact@wearefractal.com>

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

