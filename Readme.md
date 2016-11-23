#Working With Independent Disks In vCloud Director

##Introduction
vCloud has a feature called "independent disks". The feature is designed
to enable users to create virtual disks which can be attached to and
detached from virtual machines. There is no functionality to control
this feature from the user interface and therefore the scripts in this
repo enable customers to control the functionality using the API.

##Usage

Clone this repository:

```
git clone https://github.com/skyscape-cloud-services/vcloud-independent-disks
```

Edit demo.rb to include your credentials:

```
vcdconfig= {
  :user => '<vcloud_user_id>',
  :org => '<vcloud_org_id>',
  :pass => '<password>',
  :url => 'https://<api address>',
  :vdc => '<vdc_name>',
  :vapp => '<vapp_name>',
  :vm => '<vm_in_vapp_name>',
  :storage_profile => '<storage_profile_name>'
}
```

Then install gem depencies:

```
bundle install
```

And run using:

```
bundle exec ruby demo.rb
```


n.b the Gemfile for this project references a local copy of
'ruby_vcloud_sdk'.
This is because UKCloud have added functionality for sotring independent
disks on different underlying storage profiles to the library. Until
VMware accept the following Pull Request
(https://github.com/vchs/ruby_vcloud_sdk/pull/16/), you will need to
clone the UKCloud ruby_vcloud_sdk and checkout the correct branch.

from the parent directory of this repository:
```
git clone git@github.com:UKCloud/ruby_vcloud_sdk.git
cd ruby_vcloud_sdk
git checkout indy_disk_storage

```
