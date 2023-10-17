# This script will create new Virtual Machines within the Azure VM on the subscription you are currently connected to.
# The number of VMs can be modified.
# The purpose of this script is to automate the creation of VMs if you are using them for select purposes, such as to allow guest users to test out a piece of software
# within the VMs that you have created here, you can then delete those VMs are start anew by running the script again.
# You can modify the image (OS distro and version) you want to use on line 16.

param([string]$resourceGroup)

$AdminCredential = Get-Credential -Message "Enter a username/password to use for the VM Administrator"
    # this will create a new username/password to be used with managing the newly created VMs

For ($i = 1; $i -le 3; $i++)  # this creates 3 new VMs. you can change the -le value to however many VMs you wish the loop to create
{
$vmName = "VirtualMachine" + $i  # the purpose of this line is to create a new vm with specified name and then add to the loop
Write-Host "Creating VMs: " $vmName
New-AzVm -ResourceGroupName $ResourceGRoup -Name $vmName -Credential $AdminCredential -Image Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest
}
