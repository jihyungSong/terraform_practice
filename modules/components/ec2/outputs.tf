output "webserver_ids" {
    value       =   aws_instance.webserver.*.id
}

output "webserver_privater_ips" {
    value       =   aws_instance.webserver.*.private_ip
}
