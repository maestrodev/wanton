#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'vagrant'
require 'vagrant/cli'
require 'pp'

class Shrinkwrap < Sinatra::Application 
  get '/up' do
    body "We do an up"
        vagrant_dir=File.expand_path(File.dirname(__FILE__))
        puts "we are loading the config file"
        @vagrant_env=Vagrant::Environment.new(:cwd => vagrant_dir)
        pp @vagrant_env
        @vagrant_env.load!
        puts "we are uping the machine, please wait..."
        Vagrant::CLI.start(["up"], :env => @vagrant_env)
        body "We are up"
  end
end
