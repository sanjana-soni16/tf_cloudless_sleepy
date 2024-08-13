# Create an arbitrary local resource
data "template_file" "test" {
  template = "Hello, I am a template. My sample_var value = $${sample_var}"

  vars = {
    sample_var = "${var.sample_var}"
  }
}
resource "time_sleep" "wait_345600_seconds" {

  create_duration = "345600s"
}