require './placement.rb'

vcdconfig= {
  :user => '<vcloud_user_id>',
  :org => '<vcloud_org_id>',
  :pass => '<password>',
  :url => 'https://<api address>',
  :vdc => '<vdc_name>',
  :vapp => '<vapp_name>',
  :vm => '<vm_in_vapp_name>'
}


p = Placement.new(vcdconfig)

#get the vm
vm = p.get_vm(vcdconfig[:vapp],vcdconfig[:vm])


#create a new disk:
disk = p.create_independent_disk('ind_1',102400)


#attach a disk
vm = p.attach_disk(disk,vm)


#detach all independent disks
vm.independent_disks.each {|disk| p.detach_disk(vm,disk)}


#list all independent disks in vdc
disks = p.list_disks


#delete all independent disks in the vdc
disks.each {|disk_name| p.delete_disk(disk_name)}

