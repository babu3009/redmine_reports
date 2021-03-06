require 'redmine'

Dir[directory + '/lib/reports/**/*.rb'].each do |report|
  require report
end

Redmine::Plugin.register :redmine_reports do
  name 'Redmine Reports plugin'
  author 'Eric Davis'
  url 'https://projects.littlestreamsoftware.com/projects/redmine-reports'
  author_url 'http://www.littlestreamsoftware.com'
  description 'This is a plugin for Redmine reports'
  version '0.1.0'
  
  requires_redmine :version_or_higher => '0.8.0'

  menu :top_menu, :reports, { :controller => 'system_reports', :action => 'index'}, :caption => :reports_menu, :if => Proc.new{User.current.logged?}

  settings(:default => {
             'select_size' => '5',
             'completion_count' => {
               'exclude_statuses' => []
             }
           },
           :partial => 'settings/redmine_reports_settings')
end
