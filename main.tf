# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars = {
    sample_var = "${var.sample_var}"
  }
}

# This resource will destroy (potentially immediately) after null_resource.next
resource "null_resource" "previous" {}

resource "time_sleep" "wait_345600_seconds" {
  depends_on = [null_resource.previous]

  create_duration = "345600s"
}

# This resource will create (at least) 30 seconds after null_resource.previous
resource "null_resource" "next" {
  depends_on = [time_sleep.wait_345600_seconds]
}
