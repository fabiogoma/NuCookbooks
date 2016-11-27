# nucookbook Cookbook

This cookbook is used to provision AWS EC2 instances

## Requirements

Requirements for this cookbook are:

### Platforms

- Linux (RHEL based SO)

### Chef

- Chef 12.0 or later

### Cookbooks

- `none` - nucookbook doesn't needs any other cookbook to run.

## Docker images

The list below, must be available at https://hub.docker.com

<table>
  <tr>
    <th>Image</th>
    <th>Version</th>
  </tr>
  <tr>
    <td>fabiogoma/nudummy</td>
    <td>latest</td>
  </tr>
  <tr>
    <td>fabiogoma/nuprovisioner</td>
    <td>latest</td>
  </tr>
  <tr>
    <td>fabiogoma/nuscheduler</td>
    <td>latest</td>
  </tr>
  <tr>
    <td>fabiogoma/nudestroyer</td>
    <td>latest</td>
  </tr>
</table>

### Recipes

<table>
  <tr>
    <th>name</th>
  </tr>
  <tr>
    <td><tt>['nucookbook']['docker_install']</tt></td>
  </tr>
    <tr>
    <td><tt>['nucookbook']['docker_provisioner']</tt></td>
  </tr>
    <tr>
    <td><tt>['nucookbook']['docker_dummy']</tt></td>
  </tr>
</table>

## Usage

### nucookbook::default

The recipes will be used by OpsWorks and Chef Zero, no Chef Server infrastructure are needed
