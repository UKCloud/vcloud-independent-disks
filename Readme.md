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
  :vm => '<vm_in_vapp_name>'
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
