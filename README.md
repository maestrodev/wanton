<http://jedi.be/blog/2011/03/31/installable-vagrant-boxes/>

Initial whack at "projectizing" Patrick Debois' idea for packaging
Vagrant boxes as deliverable Java Jar artifacts, to include a web-based
admin UI for managing instances.

# Requires

* VirtualBox
* JRuby
* rake and bundler

# Clone

    $ git clone git@github.com:maestrodev/wanton.git

# Bundle

    $ bundle install

# Edit

Configure your base box environment by editing the lib/Vagrantfile
appropriately.  The default is this box:

<http://files.vagrantup.com/lucid32.box>

# Package

    $ rake

# Run

    $ java -jar wanton.jar

The first time run will take a bit to fetch the box from S3, and launch.
Hopefully you see something like this:

    [Winstone 2011/03/31 20:45:31] - Beginning extraction from war file
    [Winstone 2011/03/31 20:45:33] - No webapp classes folder found -
    /private/var/folders/i5/i5UtK1YGGBmH5OaJiz7cX++++TI/-Tmp-/winstoneEmbeddedWAR/WEB-INF/classes
    [webapp 2011/03/31 20:45:33] - jruby 1.6.0 (ruby 1.8.7 patchlevel 330)
    (2011-03-15 f3b6154) (Java HotSpot(TM) 64-Bit Server VM 1.6.0_24)
    [darwin-x86_64-java]
    [Winstone 2011/03/31 20:45:40] - HTTP Listener started: port=8080
    [Winstone 2011/03/31 20:45:40] - AJP13 Listener started: port=8009
    [Winstone 2011/03/31 20:45:40] - Winstone Servlet Engine v0.9.10

Then from a browser/client hit http://localhost:8080/up and you should
see this in the console:

    running: controlPort=disabled
    we are loading the config file
    #<Vagrant::Environment:0x100c
     @cwd=
     #<Pathname:/private/var/folders/i5/i5UtK1YGGBmH5OaJiz7cX++++TI/-Tmp-/winstoneEmbeddedWAR/WEB-INF/lib>,
     @loaded=false,
     @parent=nil,
     @vm=nil>
    we are uping the machine, please wait...

And when it finishes loading:

    [webapp 2011/03/31 20:47:52] - 0:0:0:0:0:0:0:1%0 -  [31/Mar/2011 20:47:52] "GET /up " 200 9 73.6910

    [webapp 2011/03/31 20:47:53] - 0:0:0:0:0:0:0:1%0 -  [31/Mar/2011 20:47:53] "GET /favicon.ico " 404 18 0.0230

Then, in the browser you see:

    We are up

# Cleanup

    $ rake clobber

# Fork Away

To create your boxes!  This project isn't meant to be configurable, just re-used to fabricate your own JAR-based deliverable VMs.  It is expected that you'd want to do that anyway by populating the Vagrantfile with your OS and application configuration apparatus (Puppet or Chef).
