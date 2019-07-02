require 'cocoapods-delete-scheme/command'

Pod::HooksManager.register('cocoapods-delete-scheme', :post_install) do |context, user_options|
    require 'fileutils'
  
    schemes_dir = Xcodeproj::XCScheme.user_data_dir(context.pods_project.path)
  
    Pod::UI.puts "Deleting all schemes for 'Pods' project, #{schemes_dir}"
    FileUtils.remove_dir(schemes_dir) if File.directory?(schemes_dir)

    Pod::UI.puts "Writing empty 'xcschememanagement' for 'Pods' project"
    FileUtils.mkdir_p(schemes_dir)

    xcschememanagement = {}
    xcschememanagement['SchemeUserState'] = {}
    xcschememanagement['SuppressBuildableAutocreation'] = {}

    context.pods_project.targets.each do | target |
        Pod::UI.puts "#{target.uuid}"

        xcschememanagement['SuppressBuildableAutocreation']["#{target.uuid}"] = {}
        xcschememanagement['SuppressBuildableAutocreation']["#{target.uuid}"]['primary'] = true
    end

    xcschememanagement_path = schemes_dir + 'xcschememanagement.plist'
    Xcodeproj::Plist.write_to_path(xcschememanagement, xcschememanagement_path)

    #File.delete(scheme_path) #if File.exist?(scheme_path)
    #FileUtils.rm(scheme_path) if File.exist?(scheme_path)
end