variable "location" {
  description = "The Azure location where all resources in this tkg should be created"
  type=string
  default="eastus"
}

variable "publicipprefixname" {
  type=string
  default="tkg-public-ip-prefix"
}

variable "cluster" {
  type = object({
       mgmt-cluster-name = string
       workload-cluster-name = string
       vnet_name_TKG = string
       vnet_cidr_TKG = string 
       subnet_name_Bootstrap = string 
       subnet_cidr_Bootstrap = string  
       nsg_name_nic_Bootstrap = string  
       subnet_name_MgmtControl = string  
       subnet_cidr_MgmtControl = string  
       nsg_name_mgmt_control_plane = string 
       subnet_name_MgmtWorker = string 
       subnet_cidr_MgmtWorker = string 
       subnet_name_WorkloadControl = string  
       subnet_cidr_WorkloadControl = string  
       nsg_name_workload_control_plane = string 
       subnet_name_WorkloadWorker = string  
       subnet_cidr_WorkloadWorker = string 
       vm_name_Bootstrap = string 
       nic_name_Bootstrap = string 
       pip_name_vm_bootstrap = string   
       vm_size = string 
       vm_admin_name = string 
       vm_admin_pwd = string 
       publicipname = string
       natgatewayname = string
       publicipprefixname = string
  })
  default = {
        mgmt-cluster-name = "mgmt-cluster1098" 
        workload-cluster-name = "workload-cluster"
        vnet_name_TKG  = "vnet-tkg"  
        vnet_cidr_TKG  = "10.0.0.0/16"
        subnet_name_Bootstrap = "subnetBootstrap" 
        subnet_cidr_Bootstrap = "10.0.0.0/24"
        nsg_name_nic_Bootstrap = "nsg-vm-bootstrap"
        subnet_name_MgmtControl = "subnetMgmtControlPlane"
        subnet_cidr_MgmtControl = "10.0.1.0/24"
        nsg_name_mgmt_control_plane = "nsg-MgmtControlPlane"
        subnet_name_MgmtWorker = "subnetMgmtWorker"
        subnet_cidr_MgmtWorker = "10.0.2.0/24"
        subnet_name_WorkloadControl = "subnetWorkloadControlPlane"
        subnet_cidr_WorkloadControl = "10.0.3.0/24"
        nsg_name_workload_control_plane = "nsg-WorkloadControlPlane"
        subnet_name_WorkloadWorker = "subnetWorkloadWorker"
        subnet_cidr_WorkloadWorker = "10.0.4.0/24"
        vm_name_Bootstrap = "bch-vm-bootstrap-ubuntu"
        nic_name_Bootstrap = "vm-bootstrap-ubu2004"
        pip_name_vm_bootstrap = "bch-vm-bootstrap-ubuntu-ip"
        vm_size = "Standard_D2s_V3"
        vm_admin_name = "demoadmin"
        vm_admin_pwd = "d@@@@1234AAAA" 
        publicipname  = "tkg-public-ip"
        natgatewayname = "tkg-nat-gw"
        publicipprefixname = "tkg-public-ip-prefix"
  }

}




variable "nsg_name" {
  type = object({
    nsg_name_mgmt_worker            = string
    nsg_name_workload_worker        = string
    nsg_name_mgmt_control_plane     = string
    nsg_name_workload_control_plane = string
  })

  default = {
    nsg_name_mgmt_worker            = "mgmt-cluster1098-node-nsg"
    nsg_name_workload_worker        = "nsg-MgmtControlPlane-node-nsg"
    nsg_name_mgmt_control_plane     = "mgmt-cluster1098-controlplane-nsg"
    nsg_name_workload_control_plane = "nsg-WorkloadControlPlane-controlplane-nsg"
  }
}
