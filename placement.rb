require 'ruby_vcloud_sdk'


class Placement
attr_accessor :vdc

  def initialize(creds)
    @creds = creds
    @client = VCloudSdk::Client.new(creds[:url],"#{creds[:user]}@#{creds[:org]}",creds[:pass],{},Logger.new('placement.log'))
    @vdc = @client.find_vdc_by_name(@creds[:vdc])
  end

  def get_vm(vapp_name, vm_name)
    vapp = @vdc.find_vapp_by_name(vapp_name)
    vm = vapp.find_vm_by_name(vm_name)
  end

  def create_independent_disk(name,size)
    begin
      puts "Looking For Disk: #{name}"
      disk = @vdc.find_disks_by_name(name).first
    rescue Exception => e
      puts "Disk Not Found, Creating"
      disk = @vdc.create_disk(name,size)
    end
    disk
  end

  def attach_disk(disk,vm)
    puts "Attaching Disk: #{disk.name} To Vm: #{vm.name}"
    begin
      vm.attach_disk(disk)
    rescue VCloudSdk::CloudError => e
      puts e.message
      return vm
    end
  end

  def detach_disk(vm,disk)
    puts "Detaching Disk: #{disk.name} From Vm: #{vm.name}"
    begin
      vm.detach_disk(disk)
    rescue VCloudSdk::CloudError => e
      puts e.message
    end
  end


  def delete_disk(disk_name)
    puts "Deleting Disk #{disk_name}"
    begin
      @vdc =@vdc.delete_disk_by_name(disk_name)
    rescue Exception => e
      puts "Deletion Not Completed: #{e.message}"
    end
  end

  def list_disks
    @vdc.list_disks
  end

end

