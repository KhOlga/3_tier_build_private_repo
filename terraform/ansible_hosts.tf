resource "local_file" "ansible_hosts" {
  filename = "../ansible/hosts.yml"
  content  = <<EOF
all:
  hosts:
    olha_public_server:
      ansible_host: ${aws_instance.server["public"].public_ip}
      ansible_user: ubuntu
      ansible_ssh_user: ubuntu
      ansible_connection: ssh
      ansible_ssh_private_key_file: olha-aws-eu-west-2-ssh-key.pem
  EOF
}
