# Use templatefile function instead of template_file data source
locals {
  rendered_template = templatefile("${path.module}/template.tpl", {
    sample_var = var.sample_var
  })
}

resource "null_resource" "sleep" {
  triggers = {
    uuid = uuid()
  }

  provisioner "local-exec" {
    command = "sleep ${var.sleepy_time}"
  }
}
